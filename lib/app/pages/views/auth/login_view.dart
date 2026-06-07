import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/values/constants.dart';
import '../../controllers/auth_controller.dart';

class LoginView extends GetView<AuthController> {
  const LoginView({super.key});

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
              "Chào Mừng Trở Lại",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),

            TextFormField(
              controller: controller.emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
              ),
            ),

            const SizedBox(height: 16),

            Obx(() => TextFormField(
              controller: controller.loginPasswordController,
              obscureText: controller.isPasswordHidden.value,
              decoration: InputDecoration(
                labelText: "Mật khẩu",
                border: const OutlineInputBorder(),
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: IconButton(
                  splashRadius: 22,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  icon: Icon(
                    controller.isPasswordHidden.value
                    ? Icons.visibility_off
                    : Icons.visibility
                  ),
                  onPressed: () {
                    controller.togglePassword();
                  },
                ),
              )
            )),

            const SizedBox(height: 12),

            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () => Get.toNamed('/verify'),
                child: const Text("Quên mật khẩu?"),
              ),
            ),

            const SizedBox(height: 20),

            Obx(() => ElevatedButton(
              onPressed: controller.isLoading.value ? null : controller.login,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: controller.isLoading.value
                  ? const SizedBox(width: 20, height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),)
                  : const Text("ĐĂNG NHẬP", style: TextStyle(fontSize: 16)),
            )),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Chưa có tài khoản?"),
                TextButton(
                  onPressed: () => Get.toNamed('/register'),
                  child: const Text("Đăng ký ngay"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}