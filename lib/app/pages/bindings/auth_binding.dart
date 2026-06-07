import 'package:get/get.dart';
import 'package:weather_app/app/pages/controllers/auth_controller.dart';

class AuthBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => AuthController(), fenix: true);
  }
}