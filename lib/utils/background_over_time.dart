import 'package:flutter/material.dart';

List<Color> backgroundOverTime(DateTime? sunrise, DateTime? sunset) {
  final now = DateTime.now();
  
  sunrise = sunrise ?? DateTime(now.year, now.month, now.day, 5, 30);
  sunset = sunset ?? DateTime(now.year, now.month, now.day, 18, 00);
  
  final Duration twoHours = Duration(hours: 2);

  // 1. Bình minh (xanh trời -> đỏ cam)
  if (now.isAfter(sunrise.subtract(twoHours)) && now.isBefore(sunrise.add(twoHours))) {
    return [Color(0xFF00A6FF), Color(0xFFFF8400)];
  }

    // 2. Hoàng hôn (đỏ cam -> đen xám)
  if (now.isAfter(sunset.subtract(twoHours)) && now.isBefore(sunset.add(twoHours))) {
    return [Color(0xFFFF8400), Color(0xFF7D7D7D)];
  }

  // 3. Ban ngày (vàng -> xanh trời)
  if (now.isAfter(sunrise.add(twoHours)) && now.isBefore(sunset.subtract(twoHours))) {
    return [Color(0xFFE0EC5A), Color(0xFF00A6FF)];
  }

  // 4. Ban đêm (xám trăng -> đen xám)
  return [Color(0xFF7D7D7D), Color(0xFF363636)];
}