import 'dart:convert';
import 'package:http/http.dart' as http;

void main() async {
  // 1. Khai báo các thông tin cần gắn vào URL
  final String city = "Nha Trang";
    final String apiKey = "e2b6ea92a9cf7971c974bcf909cb6b42"; // <-- THAY KEY VÀO ĐÂY
  final String units = "metric";
  final String lang = "vi";

  // 2. Gắn các thông tin vào URL thông qua Uri
  final url = Uri.https('api.openweathermap.org', '/data/2.5/weather', {
    'q': city,
    'appid': apiKey,
    'units': units,
    'lang': lang,
  });

  print("Đang gọi URL: $url"); // Bạn sẽ thấy các tham số được gắn sau dấu ?

  try {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print(data.toString());
    } else {
      print("Lỗi: ${response.statusCode} - ${response.body}");
    }
  } catch (e) {
    print("Lỗi kết nối: $e");
  }
}
