import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/auth_controller.dart';

class ChangePasswordView extends GetView<AuthController> {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Đặt lại mật khẩu")),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Nhập mật khẩu mới cho tài khoản của bạn",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.blueGrey,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 24),

            // New Password
            TextFormField(
              controller: controller.forgotNewPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Mật khẩu mới",
                border: const OutlineInputBorder(),
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: IconButton(
                  splashRadius: 22,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  icon: const Icon(Icons.visibility_off),
                  onPressed: () {},
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Confirm Password
            TextFormField(
              controller: controller.forgotConfirmPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Xác nhận mật khẩu",
                border: const OutlineInputBorder(),
                prefixIcon: const Icon(Icons.lock_outline),
                suffixIcon: IconButton(
                  splashRadius: 22,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  icon: const Icon(Icons.visibility_off),
                  onPressed: () {},
                ),
              ),
            ),

            const SizedBox(height: 30),

            Obx(() => ElevatedButton(
              onPressed: controller.isLoading.value
                  ? null
                  : controller.resetPassword,
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
                "CẬP NHẬT MẬT KHẨU",
                style: TextStyle(fontSize: 16),
              ),
            )),
          ],
        ),
      ),
    );
  }
}