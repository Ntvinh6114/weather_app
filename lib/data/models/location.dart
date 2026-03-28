class Location {
  final String location_id;
  final String location_name;
  final String address;
  final double lat;
  final double lon;
  final is_default;
  final DateTime created_at;

  Location({
    required this.location_id,
    required this.location_name,
    required this.address,
    required this.lat,
    required this.lon,
    required this.is_default,
    required this.created_at
  });


}