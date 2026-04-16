import 'package:weather_app/utils/generate_id.dart';
import 'package:weather_app/utils/time_state.dart';

class HourlyWeather {
  final String location_id;
  final DateTime hour;
  final double temp;
  final double feels_like;
  final String condition;
  final String icon;
  final double humidity;
  final double precip_prob;
  final double cloud_cover;
  final double wind_speed;
  final double pressure;
  final int uv_index;
  final int aqi;
  final TimeState state;

  String get weather_id => generateId('${state.name}_${location_id}_${hour.toString()}');

  HourlyWeather({
    required this.location_id,
    required this.hour,
    required this.temp,
    required this.feels_like,
    required this.condition,
    required this.icon,
    required this.humidity,
    required this.precip_prob,
    required this.cloud_cover,
    required this.wind_speed,
    required this.pressure,
    required this.uv_index,
    required this.aqi,
    required this.state,
  });

  factory HourlyWeather.fromJson(Map<String, dynamic> json) {
    return HourlyWeather(
      location_id: json['location_id'],
      hour: json['datetime'],
      temp: json['temp'],
      feels_like: json['feelslike'],
      condition: json['conditions'],
      icon: json['icon'],
      humidity: json['humidity'],
      precip_prob: json['precipprob'],
      cloud_cover: json['cloudcover'],
      wind_speed: json['windspeed'],
      pressure: json['pressure'],
      uv_index: (json['uvindex'] as num).toInt(),
      aqi: (json['aqius'] as num?)?.toInt() ?? -1,
      state: json['state'],
    );
  }
}