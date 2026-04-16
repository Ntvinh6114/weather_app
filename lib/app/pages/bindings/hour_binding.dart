import 'package:get/get.dart';
import 'package:weather_app/app/pages/controllers/hour_controller.dart';
import 'package:weather_app/data/providers/weather_api.dart';
import 'package:weather_app/data/services/local_db_service/app_database.dart';
import 'package:weather_app/data/services/location_service/get_location.dart';

class HourBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => HourController(Get.find<AppDatabase>(), Get.find<WeatherAPI>(), Get.find<LocationService>()));
  }
}