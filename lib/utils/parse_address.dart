String parseAddress(Map address) {

  // ===== LẤY WARD =====
  String? ward = address['suburb'];
  ward ??= address['village'];
  ward ??= address['town'];
  ward ??= address['city_district'];

  // ===== LẤY CITY =====
  String? city = address['city'];
  city ??= address['province'];
  city ??= address['state'];

  // ===== VALIDATE =====
  if (ward!.isEmpty && city!.isEmpty) {
    return "Unknown location";
  }

  if (ward.isEmpty) {
    return city ?? '';
  }

  return "$ward, $city";
}