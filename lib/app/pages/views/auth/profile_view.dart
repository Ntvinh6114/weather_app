import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/app/pages/controllers/auth_controller.dart';
import 'package:weather_app/app/routes/app_routes.dart';

class ProfileView extends GetView<AuthController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Thông tin cá nhân"),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),

              // Khối hiển thị Avatar giả lập cho đẹp giao diện
              CircleAvatar(
                radius: 50,
                backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
                child: Icon(
                  Icons.person,
                  size: 60,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              const SizedBox(height: 24),

              Obx(() {
                // Lấy dữ liệu user từ Map currentUser trong AuthController
                final user = controller.currentUser;
                final username = user['username'] ?? "Chưa cập nhật";
                final email = user['email'] ?? "Chưa cập nhật";

                return Column(
                  children: [
                    Text(
                      username,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      email,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                );
              }),

              const Spacer(),

              // --- NÚT ĐỔI MẬT KHẨU ---
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Get.toNamed(AppRoutes.verify);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor, // Dùng màu xanh chủ đạo
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 1,
                  ),
                  icon: const Icon(Icons.lock_reset_rounded),
                  label: const Text(
                    "Đổi mật khẩu",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton.icon(
                  onPressed: () {
                    _showLogoutDialog(context, controller);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 2,
                  ),
                  icon: const Icon(Icons.logout_rounded),
                  label: const Text(
                    "Đăng xuất",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  // Hàm bổ trợ hiển thị Dialog hỏi lại người dùng trước khi thoát tài khoản
  void _showLogoutDialog(BuildContext context, AuthController controller) {
    Get.defaultDialog(
      title: "Xác nhận đăng xuất",
      titleStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      middleText: "Bạn có chắc chắn muốn thoát khỏi tài khoản này không?",
      middleTextStyle: const TextStyle(fontSize: 15),
      textConfirm: "Đăng xuất",
      textCancel: "Hủy bỏ",
      confirmTextColor: Colors.white,
      buttonColor: Colors.redAccent,
      cancelTextColor: Colors.grey[700],
      onConfirm: () {
        controller.logout(); // Gọi hàm xóa GetStorage và đẩy về màn login
        Get.toNamed('/home'); // Đóng dialog
      },
    );
  }
}