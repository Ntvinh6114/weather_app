import 'package:drift/drift.dart';
import 'package:get/get.dart';
import 'package:weather_app/app/pages/controllers/location_controller.dart';
import 'package:weather_app/data/providers/weather_api.dart';
import 'package:weather_app/data/services/local_db_service/app_database.dart' hide HourlyWeather, Location, DailyWeather;
import 'package:weather_app/utils/round_hour.dart';
import 'package:weather_app/utils/time_state.dart';

import '../../../data/models/daily_weather.dart';
import '../../../data/models/hourly_weather.dart';
import '../../../data/models/location.dart';

class HomeController extends GetxController {
  final AppDatabase _localDb;
  final WeatherAPI _api;

  HomeController(this._api, this._localDb);

  final locationCtrl = Get.find<LocationController>();

  final currentHour = Rxn<HourlyWeather>();
  final currentDay = Rxn<DailyWeather>();

  final weather14days = RxList<DailyWeather>([]);
  final weather24hours = RxList<HourlyWeather>([]);

  final isLoading = false.obs;
  final isRefreshing = false.obs;

  @override
  void onInit() {
    super.onInit();

    ever(locationCtrl.selectedLocation, (location) async {
      if (location != null) {
        await _loadWeatherFromDb(location);
      }
    });
  }

  @override
  void onReady() {
    super.onReady();

    ever(locationCtrl.selectedLocation, (location) async {
      if (location != null) {
        await loadWeather(location);
      }
    });
  }

  DateTime? _shouldCall(Location location) {
    DateTime now = DateTime.now();

    if (location.last_call == null) {
      location.last_call = now;
      return now;
    }

    final difference = now.difference(location.last_call!);

    if (difference.inMinutes >= 30) {
      location.last_call = now;
      return now;
    }

    print('Chưa thể gọi dữ liệu mới!');
    return null;
  }

  Future<void> loadWeather(Location location) async {
    if (isLoading.value) return;

    DateTime? shouldCall = _shouldCall(location);
    if (shouldCall == null) return;
    location.last_call = shouldCall;

    try {
      isLoading(true);

      // Gọi API và lưu trực tiếp vào database
      await _api.loadDataWeather(location);

      // Đọc dữ liệu mới từ DB để cập nhật UI
      await _loadWeatherFromDb(location);

      locationCtrl.updateLocation(location);
      print("Đã nạp dữ liệu thời tiết thành công!");
    } catch (e) {
      print("Lỗi loadWeather: $e");
    } finally {
      isLoading(false);
    }
  }

  Future<void> refreshCurrentWeather(Location location) async {
    if (isRefreshing.value) return;

    try {
      isRefreshing(true);

      // Chỉ cập nhật current weather trong db
      await _api.getCurrentWeather(location);

      // Đọc lại current mới từ DB
      final result = await (_localDb.select(_localDb.hourlyWeather)
        ..where((tbl) =>
        tbl.location_id.equals(location.location_id) &
        tbl.state.equals(TimeState.current.name)))
          .getSingleOrNull();

      if (result != null) {
        currentHour.value = HourlyWeather.fromDb(result);
      }
    } catch (e) {
      print("Lỗi refreshCurrentWeather: $e");
    } finally {
      isRefreshing(false);
    }
  }

  Future<void> _loadWeatherFromDb(Location location) async {
    // Current weather
    final resultCur = await (_localDb.select(_localDb.hourlyWeather)
      ..where((tbl) =>
      tbl.location_id.equals(location.location_id) &
      tbl.state.equals(TimeState.current.name)))
        .getSingleOrNull();

    if (resultCur != null) {
      currentHour.value = HourlyWeather.fromDb(resultCur);
    }

    // 14 ngày
    final result14days = await (_localDb.select(_localDb.dailyWeather)
      ..where((tbl) => tbl.location_id.equals(location.location_id))
      ..orderBy([(tbl) => OrderingTerm(expression: tbl.date)]))
      .get();

    if (result14days.isNotEmpty) {
      weather14days.value =
          result14days.map((e) => DailyWeather.fromDb(e)).toList();

      currentDay.value = weather14days.first;
    }

    // 24 giờ tiếp theo
    final now = roundHour(DateTime.now());

    final result24hours = await (_localDb.select(_localDb.hourlyWeather)
      ..where((tbl) =>
      tbl.location_id.equals(location.location_id) &
      tbl.state.equals(TimeState.future.name) &
      tbl.hour.isBiggerOrEqualValue(now))
      ..orderBy([
            (tbl) => OrderingTerm(
          expression: tbl.hour,
          mode: OrderingMode.asc,
        )
      ])
      ..limit(24))
        .get();

    if (result24hours.isNotEmpty) {
      weather24hours.value =
          result24hours.map((e) => HourlyWeather.fromDb(e)).toList();
    }
  }
}