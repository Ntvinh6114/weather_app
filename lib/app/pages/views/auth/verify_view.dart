import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/values/constants.dart';
import '../../controllers/auth_controller.dart';

class VerifyView extends GetView<AuthController> {
  const VerifyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: Get.back,
          icon: Icon(Icons.arrow_back, size: Constants.iconSize),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Xác Thực Tài Khoản",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            const Text(
              "Bước 1: Nhập Email để nhận mã OTP.\nBước 2: Nhập mã nhận được để đổi mật khẩu.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey, height: 1.4),
            ),

            const SizedBox(height: 30),

            // Email + Send OTP
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: controller.emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: "Email tài khoản",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email),
                    ),
                  ),
                ),

                const SizedBox(width: 10),

                Obx(() => ElevatedButton(
                  onPressed: controller.isLoading.value
                      ? null
                      : controller.sendForgotOtp,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    backgroundColor: Colors.blueGrey,
                  ),
                  child: const Text("Gửi mã"),
                )),
              ],
            ),

            const SizedBox(height: 16),

            // OTP
            TextFormField(
              controller: controller.forgotOtpController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Nhập mã OTP vừa nhận",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.pin),
              ),
            ),

            const SizedBox(height: 24),

            Obx(() => ElevatedButton(
              onPressed: controller.isLoading.value
                  ? null
                  : controller.verifyForgotOtp,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: controller.isLoading.value
                  ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(strokeWidth: 2),
              )
                  : const Text(
                "XÁC NHẬN MÃ",
                style: TextStyle(fontSize: 16),
              ),
            )),
          ],
        ),
      ),
    );
  }
}