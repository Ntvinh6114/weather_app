import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/values/constants.dart';
import '../../controllers/auth_controller.dart';

class RegisterView extends GetView<AuthController> {
  const RegisterView({super.key});

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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                "Tạo Tài Khoản Mới",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 30),

              // Username
              TextFormField(
                controller: controller.registerUsernameController,
                decoration: const InputDecoration(
                  labelText: "Tên người dùng",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
              ),

              const SizedBox(height: 16),

              // Email + Send OTP
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: controller.emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        labelText: "Địa chỉ Email",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.email),
                      ),
                    ),
                  ),

                  const SizedBox(width: 10),

                  Obx(() => ElevatedButton(
                    onPressed: controller.isLoading.value
                        ? null
                        : controller.sendRegisterOtp,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      backgroundColor: Colors.blueGrey,
                    ),
                    child: const Text(
                      "Gửi mã",
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
                ],
              ),

              const SizedBox(height: 16),

              // OTP
              TextFormField(
                controller: controller.registerOtpController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Mã OTP xác nhận Email",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.pin),
                ),
              ),

              const SizedBox(height: 16),

              // Password
              Obx(() => TextFormField(
                controller: controller.registerPasswordController,
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
                ),
              )),

              const SizedBox(height: 16),

              // Confirm Password
              Obx(() => TextFormField(
                controller: controller.registerConfirmPasswordController,
                obscureText: controller.isConfirmPasswordHidden.value,
                decoration: InputDecoration(
                  labelText: "Xác nhận mật khẩu",
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.lock_outline),
                  suffixIcon: IconButton(
                    splashRadius: 22,
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    icon: Icon(
                        controller.isConfirmPasswordHidden.value
                        ? Icons.visibility_off
                        : Icons.visibility
                    ),
                    onPressed: () {
                      controller.toggleConfirmPassword();
                    },
                  ),
                ),
              )),

              const SizedBox(height: 30),

              // Register Button
              Obx(() => ElevatedButton(
                onPressed: controller.isLoading.value
                    ? null
                    : controller.registerAndLogin,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Colors.blue,
                ),
                child: controller.isLoading.value
                    ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
                    : const Text(
                  "XÁC NHẬN & ĐĂNG KÝ",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Đã có tài khoản?"),
                  TextButton(
                    onPressed: Get.back,
                    child: const Text(
                      "Đăng nhập ngay",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}