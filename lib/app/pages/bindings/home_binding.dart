import 'package:get/get.dart';
import 'package:weather_app/app/pages/controllers/home_controller.dart';

class HomeBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(Get.find(), Get.find()),);
  }
}