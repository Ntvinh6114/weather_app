String parseAddress(Map address) {
  // ===== GET WARD =====
  String ward = address['suburb'] ??
      address['village'] ??
      address['town'] ??
      address['city_district'] ??
      '';

  // ===== GET CITY =====
  String city = address['state'] ??
      address['province'] ??
      address['city'] ??
      '';

  // ===== VALIDATE =====
  if (ward.isEmpty && city.isEmpty) {
    return "Unknown location";
  }

  if (ward.isEmpty) {
    return city;
  }

  if (city.isEmpty) {
    return ward;
  }

  return "$ward, $city";
}