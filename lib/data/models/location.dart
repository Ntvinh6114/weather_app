import 'package:weather_app/data/services/local_db_service/app_database.dart';

import '../../utils/parse_address.dart';
import '../../utils/generate_id.dart';


class Location {
  final String address;
  final double lat;
  final double lon;
  final bool is_default;
  String get location_id => generateId(normalizeAddressKey(this.address));
  String get location_name => address.split(',')[0];

  Location({
    required this.address,
    required this.lat,
    required this.lon,
    required this.is_default,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    final address = parseAddress(json['address']);

    return Location(
      address: address,
      lat: double.parse(json['lat']),
      lon: double.parse(json['lon']),
      is_default: false,
    );
  }

  factory Location.fromDb(LocationData data) {

    return Location(
        address: data.address,
        lat: data.lat,
        lon: data.lon,
        is_default: data.is_default);
  }
}