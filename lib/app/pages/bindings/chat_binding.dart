import 'package:get/get.dart';
import 'package:weather_app/app/pages/controllers/chat_controller.dart';

class ChatBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatController>(() => ChatController());
  }
}