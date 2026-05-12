import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/location.dart';
import '../../common/values/api.dart';

class ReverseLocationApi {
  static String get _baseUrl => LOCATION_BASE_URL;

  final http.Client _httpClient;

  ReverseLocationApi({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  Future<Location> getLocation(double lat, double lon) async {
    final url = Uri.https(_baseUrl, 'reverse', {
      "lat": lat.toString(),
      "lon": lon.toString(),
      "format": "json",
    });

    try {
      print("Đã nhận vị trí!!");

      final response = await _httpClient.get(url,
        headers: {
          'User-Agent': 'Weather_App_Project',
          'Accept': 'application/json',
        });

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data == null || data['address'] == null) {
          throw Exception('No address data found in the server response.');
        }

        return Location.fromJson(data);
      } else {
        // Case where server returns 4xx or 5xx errors
        throw Exception('Failed to load location. Server error: ${response.statusCode}');
      }
    } catch (e) {
      // General error (Network issue, parsing issue, etc.)
      throw Exception('An error occurred while fetching location: $e');
    }
  }
}