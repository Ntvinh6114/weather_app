import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart' hide Value;
import 'package:weather_app/data/providers/my_api.dart';
import 'package:weather_app/data/providers/reverse_location_api.dart';
import 'package:weather_app/data/providers/weather_api.dart';
import 'package:weather_app/data/services/local_db_service/app_database.dart' hide Location, HourlyWeather;
import 'package:weather_app/data/services/location_service/get_location.dart';
import 'package:weather_app/data/models/location.dart';
import 'package:drift/drift.dart';
import 'package:weather_app/utils/time_state.dart';

import '../../../data/models/hourly_weather.dart';


class LocationController extends GetxController {
  final AppDatabase _localDb;
  final ReverseLocationApi _rla;
  final LocationService _ls;

  LocationController(this._localDb, this._rla, this._ls);

  final WeatherAPI _weatherApi = Get.find();
  final MyApi _myApi = Get.find();

  final selectedLocation = Rxn<Location>();
  final listDisplayLocation = RxList<MapEntry<String, HourlyWeather>>();

  final isLoading = false.obs;
  final curLocation = "".obs;
  final RxList<dynamic> results = <dynamic>[].obs;

  Timer? _debounce;
  final isSearching = false.obs;

  @override
  void onInit() async {
    super.onInit();
    await loadCurrentLocation();
    await getListCurWeather();
  }

  Future<void> getListCurWeather() async {
    if (isLoading.value) return;

    try {
      isLoading.value = true;

      final dbData = await _localDb.select(_localDb.location).get();
      final locations = dbData.map((e) => Location.fromDb(e)).toList();

      final weatherFutures = locations.map((loc) async {
          // cập nhật current weather mới vào DB
          await _weatherApi.getCurrentWeather(loc);

          // đọc lại current weather từ DB
          final result = await (_localDb.select(_localDb.hourlyWeather)
            ..where((tbl)
              => tbl.location_id.equals(loc.location_id) &
              tbl.state.equals(TimeState.current.name)))
            .getSingle();

          return MapEntry(
            loc.location_name,
            HourlyWeather.fromDb(result),
          );
      });

      final entries = await Future.wait(weatherFutures);
      listDisplayLocation.value = entries;
    } catch (e) {
      print("Lỗi getListCurWeather: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> loadCurrentLocation() async {
    if (isLoading.value) return;
    if (selectedLocation.value != null) return;

    try {
      isLoading.value = true;

      Position? pos = await _ls.getLocation();
      if (pos == null) {
        throw Exception("Không lấy được GPS.");
      }

      // bỏ trạng thái default cũ
      await _localDb.update(_localDb.location).write(
        const LocationCompanion(
          is_default: Value(false),
        ),
      );

      final location = await _rla.getLocation(pos.latitude, pos.longitude);

      final companion = LocationCompanion(
        location_id: Value(location.location_id),
        location_name: Value(location.location_name),
        address: Value(location.address),
        lat: Value(location.lat),
        lon: Value(location.lon),
        is_default: const Value(true),
      );

      await _localDb.into(_localDb.location).insertOnConflictUpdate(companion);

      curLocation.value = location.location_id;
      selectedLocation.value = location;
    } catch (e) {
      throw Exception("Không thể xác định vị trí: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> addLocation(double lat, double lon) async {
    if (isLoading.value) return;

    try {
      isLoading.value = true;

      final location = await _rla.getLocation(lat, lon);

      final companion = LocationCompanion(
        location_id: Value(location.location_id),
        location_name: Value(location.location_name),
        address: Value(location.address),
        lat: Value(location.lat),
        lon: Value(location.lon),
      );

      await _localDb.into(_localDb.location).insertOnConflictUpdate(companion);

      curLocation.value = location.location_id;
      selectedLocation.value = location;
    } catch (e) {
      throw Exception("Không thể thêm vị trí: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> changeDefault(String id) async {
    await _localDb.update(_localDb.location).write(
      const LocationCompanion(
        is_default: Value(false),
      ),
    );

    await (_localDb.update(_localDb.location)
      ..where((tbl) => tbl.location_id.equals(id)))
        .write(
      const LocationCompanion(
        is_default: Value(true),
      ),
    );

    final result = await (_localDb.select(_localDb.location)
      ..where((tbl) => tbl.location_id.equals(id)))
        .getSingle();

    selectedLocation.value = Location.fromDb(result);
  }

  Future<void> deleteLocation(String id) async {
    if(id == selectedLocation.value?.location_id) {
      selectedLocation.value = Location.fromDb(
        await (_localDb.select(_localDb.location)
          ..where((tbl) => tbl.location_id.equals(id)))
          .getSingle()
      );
    }

    await (_localDb.delete(_localDb.location)
      ..where((tbl) => tbl.location_id.equals(id)))
      .go();

    listDisplayLocation.removeWhere(
          (element) => element.value.location_id == id
    );

    await (_localDb.delete(_localDb.hourlyWeather)
      ..where((tbl) => tbl.location_id.equals(id)))
      .go();

    await (_localDb.delete(_localDb.dailyWeather)
      ..where((tbl) => tbl.location_id.equals(id)))
      .go();
  }

  Future<void> updateLocation(Location location) async {
    await (_localDb.update(_localDb.location)
    ..where((tbl) => tbl.location_id.equals(location.location_id)))
    .write(
        LocationCompanion.insert(
          location_id: location.location_id,
          location_name: location.location_name,
          address: location.address,
          lat: location.lat,
          lon: location.lon,
          last_call: Value(location.last_call)
    ));
  }

  Future<void> onSearch(String query) async {
    if (_debounce?.isActive ?? false) {
      _debounce?.cancel();
    }

    _debounce = Timer(
      const Duration(milliseconds: 1000),
      () async {
        if (query.trim().isEmpty) {
          results.clear();
          isSearching.value = false;
          return;
        }

        try {
          isSearching.value = true;

          print('đang tìm kiếm ...');
          final res = await _myApi.searchLocation(query);

          results.assignAll(res);
        }
        catch (e) {
          print("Lỗi tìm kiếm: $e");
        }
        finally {
          isSearching.value = false;
        }
      },
    );
  }
}