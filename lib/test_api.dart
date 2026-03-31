import 'dart:convert';
import 'package:http/http.dart' as http;

void main() async {
  // 1. Khai báo các thông tin cần gắn vào URL
  final String location = "12.2461,109.1897";
    final String apiKey = "Z7KQCQZT6MZMQBZ24TW8C7J9K"; // <-- THAY KEY VÀO ĐÂY
  final String units = "metric";
  final DateTime now = DateTime.now();
  final String include = 'hours';

  // 2. Gắn các thông tin vào URL thông qua Uri
  final url = Uri.https('weather.visualcrossing.com', 'VisualCrossingWebServices/rest/services/timeline/${location}/${now.toIso8601String().split('T')[0]}', {
    'key' : apiKey,
    'unitGroup' : units,
    'include' : include
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
