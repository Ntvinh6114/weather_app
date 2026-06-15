import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:weather_app/app/pages/controllers/location_controller.dart';
import 'package:weather_app/app/routes/app_routes.dart';
import '../../../data/providers/my_api.dart';

class AuthController extends GetxController {
  final MyApi _api = MyApi();
  final GetStorage _storage = GetStorage(); // Khởi tạo khay lưu trữ GetStorage

  // Trạng thái Loading hiển thị vòng quay trên giao diện khi đang đợi API
  var isLoading = false.obs;

  // Trạng thái lưu trữ Token trong RAM khi App đang chạy
  var accessToken = "".obs;
  var currentUser = <String, dynamic>{}.obs;

  // Mã reset_token tạm thời phục vụ cho luồng Quên mật khẩu bước 3
  String _resetToken = "";

  // KEYS LƯU TRỮ TRÊN THIẾT BỊ (Dùng để GetStorage đọc/ghi)
  static const String _keyToken = "access_token";
  static const String _keyUser = "current_user";


  final emailController = TextEditingController();
  final loginPasswordController = TextEditingController();

  final registerUsernameController = TextEditingController();
  final registerOtpController = TextEditingController();
  final registerPasswordController = TextEditingController();
  final registerConfirmPasswordController = TextEditingController();

  final forgotOtpController = TextEditingController();
  final forgotNewPasswordController = TextEditingController();
  final forgotConfirmPasswordController = TextEditingController();

  final isPasswordHidden = true.obs;
  final isConfirmPasswordHidden = true.obs;

  @override
  void onReady() {
    isPasswordHidden.value = true;
    isConfirmPasswordHidden.value = true;
    super.onReady();
  }

  @override
  void onClose() {
    emailController.clear();
    loginPasswordController.clear();
    registerUsernameController.clear();
    emailController.clear();
    registerOtpController.clear();
    registerPasswordController.clear();
    registerConfirmPasswordController.clear();
    forgotOtpController.clear();
    forgotNewPasswordController.clear();
    forgotConfirmPasswordController.clear();
    super.onClose();
  }

  /// Hàm kiểm tra xem người dùng đã từng đăng nhập trước đó chưa
  bool checkLoggedUser() {
    String? savedToken = _storage.read<String>(_keyToken);
    Map<String, dynamic>? savedUser = _storage.read<Map<String, dynamic>>(_keyUser);

    if (savedToken != null && savedUser != null) {
      accessToken.value = savedToken;
      currentUser.value = savedUser;

      return true;
    }

    return false;
  }

  bool syncLocation() {

    return true;
  }

  /// Hàm thực hiện Đăng xuất, xóa sạch dữ liệu lưu trong máy
  void logout() {
    _storage.remove(_keyToken);
    _storage.remove(_keyUser);
    accessToken.value = "";
    currentUser.value = {};
  }

  // --- 1. XỬ LÝ ĐĂNG NHẬP ---
  Future<void> login() async {
    final email = emailController.text.trim();
    final password = loginPasswordController.text;

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar("Cảnh báo", "Vui lòng điền đầy đủ Email và Mật khẩu.");
      return;
    }

    try {
      isLoading.value = true;
      final result = await _api.login(email: email, password: password);

      // 1. Cập nhật vào RAM của ứng dụng
      accessToken.value = result['access_token'];
      currentUser.value = result['user'];

      // 2. [LƯU CỨNG VÀO MÁY]: Ghi dữ liệu lâu dài thông qua GetStorage
      await _storage.write(_keyToken, result['access_token']);
      await _storage.write(_keyUser, result['user']);

      // 3. Sử dụng Get.snackbar thông báo trực tiếp
      Get.snackbar("Thành công", result['message'] ?? "Đăng nhập thành công!");

      emailController.clear();
      loginPasswordController.clear();

      Get.toNamed(AppRoutes.home);
    } catch (e) {
      Get.snackbar("Đăng nhập thất bại", e.toString().replaceAll("Exception: ", ""));
    } finally {
      isLoading.value = false;
    }
  }

  // --- 2. ĐĂNG KÝ: BƯỚC 1 - GỬI OTP ---
  Future<void> sendRegisterOtp() async {
    final email = emailController.text.trim();

    if (email.isEmpty) {
      Get.snackbar("Cảnh báo", "Vui lòng nhập địa chỉ Email trước khi nhận mã.");
      return;
    }

    try {
      isLoading.value = true;
      final result = await _api.registerSendOtp(email: email);
      Get.snackbar("Thông báo", result['message'] ?? "Mã OTP đã được gửi.");
    } catch (e) {
      Get.snackbar("Lỗi gửi mã", e.toString().replaceAll("Exception: ", ""));
    } finally {
      isLoading.value = false;
    }
  }

  // --- 3. ĐĂNG KÝ: BƯỚC 2 - XÁC THỰC & TỰ ĐỘNG ĐĂNG NHẬP ---
  Future<void> registerAndLogin() async {
    final username = registerUsernameController.text.trim();
    final email = emailController.text.trim();
    final otp = registerOtpController.text.trim();
    final password = registerPasswordController.text;
    final confirmPassword = registerConfirmPasswordController.text;

    if (username.isEmpty || email.isEmpty || otp.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      Get.snackbar("Cảnh báo", "Vui lòng nhập đầy đủ tất cả các trường dữ liệu.");
      return;
    }

    try {
      isLoading.value = true;

      final result = await _api.register(
        username: username,
        email: email,
        otpCode: otp,
        password: password,
        confirmPassword: confirmPassword,
      );

      // 1. Cập nhật vào RAM ứng dụng
      accessToken.value = result['access_token'];
      currentUser.value = result['user'];

      // 2. [LƯU CỨNG VÀO MÁY]: Đăng nhập luôn bằng cách ghi đè token vào GetStorage
      await _storage.write(_keyToken, result['access_token']);
      await _storage.write(_keyUser, result['user']);

      Get.snackbar("Thành công", result['message'] ?? "Tạo tài khoản thành công!");

      registerUsernameController.clear();
      emailController.clear();
      registerOtpController.clear();
      registerPasswordController.clear();
      registerConfirmPasswordController.clear();

      Get.toNamed(AppRoutes.home);
    } catch (e) {
      Get.snackbar("Đăng ký thất bại", e.toString().replaceAll("Exception: ", ""));
    } finally {
      isLoading.value = false;
    }
  }

  // --- 4. QUÊN MẬT KHẨU: BƯỚC 1 - GỬI OTP ---
  Future<void> sendForgotOtp() async {
    final email = emailController.text.trim();

    if (email.isEmpty) {
      Get.snackbar("Cảnh báo", "Vui lòng nhập Email để hệ thống tìm kiếm.");
      return;
    }

    try {
      isLoading.value = true;
      final result = await _api.passwordForgot(email: email);
      Get.snackbar("Thông báo", result['message'] ?? "Mã OTP khôi phục đã được gửi.");
    } catch (e) {
      Get.snackbar("Lỗi gửi mã", e.toString().replaceAll("Exception: ", ""));
    } finally {
      isLoading.value = false;
    }
  }

  // --- 5. QUÊN MẬT KHẨU: BƯỚC 2 - XÁC THỰC OTP ---
  Future<void> verifyForgotOtp() async {
    final email = emailController.text.trim();
    final otp = forgotOtpController.text.trim();

    if (email.isEmpty || otp.isEmpty) {
      Get.snackbar("Cảnh báo", "Vui lòng nhập đầy đủ Email và mã OTP.");
      return;
    }

    try {
      isLoading.value = true;
      final result = await _api.passwordVerifyOtp(email: email, otpCode: otp);
      _resetToken = result['reset_token'];

      Get.snackbar("Xác thực thành công", result['message'] ?? "Mời bạn nhập mật khẩu mới.");
      Get.offAndToNamed(AppRoutes.password);
    } catch (e) {
      Get.snackbar("Xác thực thất bại", e.toString().replaceAll("Exception: ", ""));
    } finally {
      isLoading.value = false;
    }
  }

  // --- 6. QUÊN MẬT KHẨU: BƯỚC 3 - ĐỔI PASS ---
  Future<void> resetPassword() async {
    final newPass = forgotNewPasswordController.text;
    final confirmPass = forgotConfirmPasswordController.text;

    if (newPass.isEmpty || confirmPass.isEmpty) {
      Get.snackbar("Cảnh báo", "Vui lòng điền mật khẩu mới và xác nhận.");
      return;
    }

    if (_resetToken.isEmpty) {
      Get.snackbar("Lỗi", "Phiên làm việc lỗi, vui lòng thực hiện lại từ đầu.");
      return;
    }

    try {
      isLoading.value = true;
      final result = await _api.passwordReset(
        token: _resetToken,
        newPassword: newPass,
        confirmPassword: confirmPass,
      );

      Get.snackbar("Thành công", result['message'] ?? "Đổi mật khẩu thành công!");

      emailController.clear();
      forgotOtpController.clear();
      forgotNewPasswordController.clear();
      forgotConfirmPasswordController.clear();
      _resetToken = "";
    } catch (e) {
      Get.snackbar("Lỗi đổi mật khẩu", e.toString().replaceAll("Exception: ", ""));
    } finally {
      isLoading.value = false;
    }
  }

  void togglePassword() {
    isPasswordHidden.toggle();
  }

  void toggleConfirmPassword() {
    isConfirmPasswordHidden.toggle();
  }
}