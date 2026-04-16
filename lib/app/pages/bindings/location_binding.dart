import 'package:get/get.dart';
import 'package:weather_app/app/pages/controllers/location_controller.dart';

class LocationBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => LocationController(Get.find(), Get.find(), Get.find()), fenix: true);
  }
}