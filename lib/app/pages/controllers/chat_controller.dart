import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/data/providers/my_api.dart';
import 'package:weather_app/app/pages/controllers/auth_controller.dart';
import 'package:weather_app/app/pages/controllers/location_controller.dart';

class ChatController extends GetxController {
  final MyApi _api = MyApi();
  final AuthController _authCtrl = Get.find<AuthController>();
  // final LocationController _locationCtrl = Get.find<LocationController>();

  var messages = <dynamic>[].obs;
  var isSending = false.obs;
  var isLoggedIn = false.obs;

  final chatTextController = TextEditingController();
  final scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    _checkLoginStatus();
  }

  void _checkLoginStatus() {
    isLoggedIn.value = _authCtrl.accessToken.value.isNotEmpty;
    if (isLoggedIn.value) {
      _loadHistory();
    }
  }

  Future<void> _loadHistory() async {
    try {
      String token = _authCtrl.accessToken.value;
      var history = await _api.getChatHistory(token);

      // Đảo ngược danh sách nếu backend trả về từ cũ đến mới (tùy vào SQL order)
      messages.assignAll(history);
      _scrollToBottom();
    } catch (e) {
      debugPrint("Lỗi tải lịch sử chat: $e");
    }
  }

  Future<void> sendMessage() async {
    final text = chatTextController.text.trim();
    if (text.isEmpty) return;

    String token = _authCtrl.accessToken.value;
    chatTextController.clear();

    // 1. Thêm tin nhắn user vào màn hình
    messages.add({"role": "user", "content": text});
    _scrollToBottom();

    try {
      isSending.value = true;

      // 2. Định dạng ngày tháng và vị trí hiện tại khớp với ChatRequest
      String currentDate = DateTime.now().toIso8601String();
      Map<String, dynamic> locationData = {
        "name": "Đông Ninh Hòa, Khánh Hòa",
        "lat": 12.48,
        "lon": 109.13
      };

      // 3. Gọi API
      String reply = await _api.sendChatMessage(
        token: token,
        message: text,
        currentDate: currentDate,
        currentLocation: locationData,
      );

      // 4. Thêm tin nhắn từ AI
      messages.add({"role": "assistant", "content": reply});
      _scrollToBottom();
    } catch (e) {
      Get.snackbar("Lỗi", e.toString().replaceAll("Exception: ", ""));
      // Loại bỏ tin nhắn lỗi ra khỏi UI nếu gửi thất bại
      messages.removeLast();
    } finally {
      isSending.value = false;
    }
  }

  void _scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }
}