import '../../utils/parse_address.dart';
import '../../utils/generate_id.dart';


class Location {

  final String location_id;
  final String address;
  final double lat;
  final double lon;
  final bool is_default;

  Location({
    required this.location_id,
    required this.address,
    required this.lat,
    required this.lon,
    required this.is_default,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    final address = parseAddress(json);

    return Location(
      location_id: generateId(normalizeAddressKey(address)),
      address: address,
      lat: json['lat'],
      lon: json['lon'],
      is_default: false,
    );
  }
}