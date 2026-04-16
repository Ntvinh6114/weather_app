import 'package:get/get.dart';
import 'package:weather_app/app/pages/controllers/location_controller.dart';
import 'package:weather_app/data/providers/weather_api.dart';
import 'package:weather_app/data/services/local_db_service/app_database.dart' hide HourlyWeather, Location, DailyWeather;
import 'package:weather_app/utils/round_hour.dart';

import '../../../data/models/daily_weather.dart';
import '../../../data/models/hourly_weather.dart';
import '../../../data/models/location.dart';


class HomeController extends GetxController {
  // service
  final AppDatabase _localDb;
  final WeatherAPI _api;

  HomeController(this._api, this._localDb);

  // location
  final locationCtrl = Get.find<LocationController>();

  // state
  final currentHour = Rxn<HourlyWeather>();
  final currentDay = Rxn<DailyWeather>();

  final weather14days = Rxn<List<DailyWeather>>();
  final weather24hours = Rxn<List<HourlyWeather>>();

  final isLoading = false.obs;
  final isRefreshing = false.obs;

  @override
  void onInit() {
    super.onInit();

    ever (locationCtrl.selectedLocation, (location) async {
      if (location != null) {
        await loadWeather(location);
      }
    });
  }


  @override
  void onReady() async {
    super.onReady();
    Location? location = locationCtrl.selectedLocation.value;
    await getCurrentWeather(location!);
  }

  Future<void> loadWeather(Location? location) async {
    // 1. Chặn nếu đang tải để tránh Status 429
    if (isLoading.value) return;

    try {
      isLoading(true);

      if (location != null) {
        await _api.loadDataWeather(location);

        currentHour.value = _api.current;
        weather14days.value = _api.listDaily;
        currentDay.value = weather14days.value![0];

        int nowMs = roundHour(DateTime.now()).millisecondsSinceEpoch;

        weather24hours.value = _api.listHourly
            .where((element) => element.hour.millisecondsSinceEpoch >= nowMs)
            .take(24)
            .toList();

        print("Đã nạp dữ liệu thời tiết thành công!");
      } else {
        print("Không tìm thấy vị trí để nạp thời tiết");
      }
    } catch (e) {
      print("Lỗi khi loadWeather: $e");
    } finally {
      isLoading(false);
    }
  }

  Future<HourlyWeather?> getCurrentWeather(Location location) async {
    return await _api.getCurrentWeather(location);
  }
}