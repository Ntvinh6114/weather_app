// String parseAddress(Map address) {
//   // ===== GET WARD =====
//   String ward = address['town'] ??
//       address['suburb'] ??
//       address['city_district'] ??
//       '';
//
//   // ===== GET CITY =====
//   String city = address['state'] ??
//       address['province'] ??
//       address['city'] ??
//       '';
//
//   // ===== VALIDATE =====
//   if (ward.isEmpty && city.isEmpty) {
//     return "Unknown location";
//   }
//
//   if (ward.isEmpty) {
//     return city;
//   }
//
//   if (city.isEmpty) {
//     return ward;
//   }
//
//   return "$ward, $city";
// }

String parseAddress(String displayName) {
  List<String> parts = displayName.split(',').map((p) => p.trim()).toList();

  if (parts.isNotEmpty && parts.last.toLowerCase() == "việt nam") {
    parts.removeLast();
  }

  if (parts.isNotEmpty && RegExp(r'^\d+$').hasMatch(parts.last)) {
    parts.removeLast();
  }

  if (parts.isEmpty) return "Unknown location";
  if (parts.length == 1) return parts.last;

  // Trả về 2 cấp cuối cùng (ví dụ: Quận/Huyện, Tỉnh/Thành phố)
  return "${parts[parts.length - 2]}, ${parts.last}";
}