import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/common/values/api.dart';

class MyApi {

  static const String _baseUrl = MY_API_URL;

  Future<List<dynamic>> searchLocation(
      String query,
      ) async {

    final uri = Uri.parse(
      "$_baseUrl/search?q=$query",
    );

    final response = await http.get(uri);

    if (response.statusCode != 200) {
      throw Exception(
        "Failed to fetch location",
      );
    }

    final data = jsonDecode(response.body);

    return data["result"];
  }
}