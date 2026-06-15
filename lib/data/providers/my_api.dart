import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/common/values/api.dart';

class MyApi {
  static const String _baseUrl = MY_API_URL;

  // --- 1. CHỨC NĂNG SEARCH CHỖ Ở (BẠN ĐÃ VIẾT) ---
  Future<List<dynamic>> searchLocation(String query) async {
    final uri = Uri.parse("http://$_baseUrl/search?q=$query");
    final response = await http.get(uri);

    if (response.statusCode != 200) {
      _handleError(response);
    }

    final data = jsonDecode(response.body);
    return data["result"];
  }

  // --- 2. API ĐĂNG NHẬP (LOGIN) ---
  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    final uri = Uri.parse("http://$_baseUrl/auth/login");

    final response = await http.post(
      uri,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "email": email,
        "password": password,
      }),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body); // Trả về: message, access_token, token_type, user
    } else {
      _handleError(response);
      return {};
    }
  }

  // --- 3. ĐĂNG KÝ: BƯỚC 1 - YÊU CẦU GỬI OTP ---
  Future<Map<String, dynamic>> registerSendOtp({required String email}) async {
    final uri = Uri.parse("http://$_baseUrl/auth/register/send-otp");

    final response = await http.post(
      uri,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"email": email}),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      _handleError(response);
      return {};
    }
  }

  // --- 4. ĐĂNG KÝ: BƯỚC 2 - XÁC THỰC OTP & ĐĂNG NHẬP LUÔN ---
  Future<Map<String, dynamic>> register({
    required String username,
    required String email,
    required String otpCode,
    required String password,
    required String confirmPassword,
  }) async {
    final uri = Uri.parse("http://$_baseUrl/auth/register");

    final response = await http.post(
      uri,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "username": username,
        "email": email,
        "otp_code": otpCode,
        "password": password,
        "confirm_password": confirmPassword,
      }),
    );

    if (response.statusCode == 201) {
      // Trả về Map chứa 'access_token' cấp luôn từ Backend để Đăng nhập ngay lập tức
      return jsonDecode(response.body);
    } else {
      _handleError(response);
      return {};
    }
  }

  // --- 5. QUÊN MẬT KHẨU: BƯỚC 1 - GỬI OTP KHÔI PHỤC ---
  Future<Map<String, dynamic>> passwordForgot({required String email}) async {
    final uri = Uri.parse("http://$_baseUrl/auth/password/forgot");

    final response = await http.post(
      uri,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"email": email}),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      _handleError(response);
      return {};
    }
  }

  // --- 6. QUÊN MẬT KHẨU: BƯỚC 2 - KIỂM TRA OTP ĐỂ LẤY RESET TOKEN ---
  Future<Map<String, dynamic>> passwordVerifyOtp({
    required String email,
    required String otpCode,
  }) async {
    final uri = Uri.parse("http://$_baseUrl/auth/password/verify-otp");

    final response = await http.post(
      uri,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "email": email,
        "otp_code": otpCode,
      }),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body); // Trả về reset_token tạm thời
    } else {
      _handleError(response);
      return {};
    }
  }

  // --- 7. QUÊN MẬT KHẨU: BƯỚC 3 - CẬP NHẬT MẬT KHẨU MỚI VÀO DB THẬT ---
  Future<Map<String, dynamic>> passwordReset({
    required String token,
    required String newPassword,
    required String confirmPassword,
  }) async {
    final uri = Uri.parse("http://$_baseUrl/auth/password/reset");

    final response = await http.post(
      uri,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "token": token,
        "new_password": newPassword,
        "confirm_password": confirmPassword,
      }),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      _handleError(response);
      return {};
    }
  }

  // --- 8. AI CHAT: LẤY LỊCH SỬ CHAT ---
  Future<List<dynamic>> getChatHistory(String token) async {
    final uri = Uri.parse("http://$_baseUrl/chat/history?limit=50");
    final response = await http.get(
      uri,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token", // Header bắt buộc từ FastAPI
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body)['messages'] ?? [];
    } else {
      _handleError(response);
      return [];
    }
  }

  // --- 9. AI CHAT: GỬI TIN NHẮN ---
  Future<String> sendChatMessage({
    required String token,
    required String message,
    required String currentDate,
    required String currentLocation
  }) async {
    final uri = Uri.parse("http://$_baseUrl/chat/");
    final response = await http.post(
      uri,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
      // Cấu trúc payload khớp hoàn toàn với pydantic ChatRequest bên Python
      body: jsonEncode({
        "message": message,
        "current_date": currentDate,
        "current_location": currentLocation
      }),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body)['answer'];
    } else {
      _handleError(response);
      return "Lỗi kết nối tới hệ thống.";
    }
  }

  Future<List<dynamic>> syncLocations({
    required String token,
    required List<Map<String, dynamic>> locations,
  }) async {
    final uri = Uri.parse("http://$_baseUrl/location/sync");

    final response = await http.post(
      uri,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
      body: jsonEncode({
        "locations": locations, // Mảng chứa các map gồm: address, latitude, longitude
      }),
    );

    if (response.statusCode == 200) {
      // Giải mã bằng UTF-8 để không bị lỗi ký tự Tiếng Việt (có dấu)
      final decodedData = jsonDecode(utf8.decode(response.bodyBytes));
      return decodedData["data"] ?? []; // Trả về danh sách vị trí máy local đang thiếu
    } else {
      _handleError(response);
      return [];
    }
  }

  void _handleError(http.Response response) {
    try {
      final decoded = jsonDecode(response.body);

      // Lấy câu thông báo Tiếng Việt từ trường 'detail' của FastAPI ra ngoài
      if (decoded is Map && decoded.containsKey('detail')) {
        throw Exception(decoded['detail']);
      }
    } catch (e) {
      if (e is Exception) rethrow;
    }

    // Fallback nếu có lỗi mạng, lỗi gateway hoặc crash server 500
    throw Exception("Hệ thống gặp sự cố không mong muốn (Mã lỗi: ${response.statusCode}).");
  }
}