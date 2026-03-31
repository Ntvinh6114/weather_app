import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/common/values/api.dart';
import 'package:weather_app/data/models/location.dart';


class ReverseLocationApi {
  
  final String BaseUrl = LOCATION_BASE_URL;
  
  Future<Location> getLocation(double lat, double lon) async {
    final url = Uri.https(BaseUrl, 'reverse',
    {
      "lat" : lat,
      "lon" : lon,
      "format" : "json",
    });

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final address = data['address'];

      return Location.fromJson(address);
    } else {
      throw Exception('Fail to load data!');
    }
  }
}