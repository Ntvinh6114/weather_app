import 'package:get/get.dart';
import 'package:weather_app/app/pages/controllers/hour_controller.dart';
import 'package:weather_app/data/services/local_db_service/app_database.dart';

class HourBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => HourController(Get.find<AppDatabase>()));
  }
}