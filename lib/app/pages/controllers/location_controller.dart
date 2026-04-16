import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart' hide Value;
import 'package:weather_app/data/providers/reverse_location_api.dart';
import 'package:weather_app/data/providers/weather_api.dart';
import 'package:weather_app/data/services/local_db_service/app_database.dart' hide Location, HourlyWeather;
import 'package:weather_app/data/services/location_service/get_location.dart';
import 'package:weather_app/data/models/location.dart';
import 'package:drift/drift.dart';

import '../../../data/models/hourly_weather.dart';

class LocationController extends GetxController {
  final AppDatabase _localDb;
  final ReverseLocationApi _rla;
  final LocationService _ls;

  LocationController(this._localDb, this._rla, this._ls);

  final WeatherAPI _weatherApi = Get.find();

  var selectedLocation = Rxn<Location>();
  var listDisplayLocation = RxList<MapEntry<String, HourlyWeather?>>();

  var isLoading = false.obs;

  var curLocation = "".obs;

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

      // 2. Chạy API song song
      final weatherFutures = locations.map((loc) async {
        try {
          final weather = await _weatherApi.getCurrentWeather(loc);
          return MapEntry("${loc.location_id}_${loc.location_name}", weather);
        } catch (e) {
          return MapEntry("${loc.location_id}_${loc.location_name}", null);
        }
      });

      final List<MapEntry<String, HourlyWeather?>> entries = await Future.wait(weatherFutures);

      listDisplayLocation.value = entries;
    } catch (e) {
      print("Lỗi: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> loadCurrentLocation() async {
    if (isLoading.value) return;

    if (selectedLocation.value != null) return;

    try {
      isLoading.value = true;
      Location? location;

      Position? pos = await _ls.getLocation();
      if (pos != null) {
        await _localDb.update(_localDb.location)
            .write(LocationCompanion(
              is_default: const Value(false),
        ));

        location = await _rla.getLocation(pos.latitude, pos.longitude);

        final companion = LocationCompanion(
          location_id: Value(location.location_id),
          location_name: Value(location.location_name ),
          address: Value(location.address),
          lat: Value(location.lat),
          lon: Value(location.lon),
          is_default: Value(true),
        );

        await _localDb.into(_localDb.location).insertOnConflictUpdate(companion);
      }
      else {
        throw Exception("Không lấy được GPS.");
      }

      curLocation.value = location.location_id;
      selectedLocation.value = location;
    } catch (e) {
      throw Exception("Không thể xác định vị trí: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> changeDefault(String id) async {
    await (_localDb.update(_localDb.location))
        .write(LocationCompanion(
        is_default: Value(false),
    ));

    await (_localDb.update(_localDb.location)
        ..where((tbl) => tbl.location_id.equals(id)))
        .write(LocationCompanion(
        is_default: Value(true),
    ));

    selectedLocation.value = Location.fromDb(
        await (_localDb.select(_localDb.location)
        ..where((tbl) => tbl.location_id.equals(id))
        ).getSingle());
  }

  Future<void> deleteLocation(String id) async {
    await (_localDb.delete(_localDb.location)
        ..where((tbl) => tbl.location_id.equals(id)))
        .go();

    listDisplayLocation.removeWhere((element) => element.key.split('_')[0] == id);
  }
}