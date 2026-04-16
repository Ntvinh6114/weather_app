import 'package:weather_app/utils/generate_description.dart';
import 'package:weather_app/utils/generate_id.dart';
import 'package:weather_app/utils/time_state.dart';

class DailyWeather {
  final String location_id;
  final DateTime date;
  final double temp_max;
  final double temp_min;
  final String condition;
  final String description;
  final String icon;
  final double precip_prob;
  final DateTime sunrise;
  final DateTime sunset;
  final TimeState state;

  String get weather_id => generateId('${location_id}_${date.toString()}');

  DailyWeather({
    required this.location_id,
    required this.date,
    required this.temp_max,
    required this.temp_min,
    required this.condition,
    required this.description,
    required this.icon,
    required this.precip_prob,
    required this.sunrise,
    required this.sunset,
    required this.state,
  });

  factory DailyWeather.fromJson(Map<String, dynamic> json) {
    return DailyWeather(
        location_id: json["location_id"],
        date: DateTime.parse(json["datetime"]),
        temp_max: json["tempmax"],
        temp_min: json["tempmin"],
        condition: json["conditions"],
        description: generateViDescription(json["description"]),
        icon: json["icon"],
        precip_prob: json["precipprob"],
        sunrise: DateTime.parse(json["sunrise"]),
        sunset: DateTime.parse(json["sunset"]),
        state: json["state"]
    );
  }
}
