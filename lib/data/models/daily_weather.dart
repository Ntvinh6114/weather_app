import 'package:weather_app/data/services/local_db_service/app_database.dart';
import 'package:weather_app/utils/generate_description.dart';
import 'package:weather_app/utils/time_state.dart';

class DailyWeather {
  final String daily_id;
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

  DailyWeather({
    required this.daily_id,
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
        daily_id: json['daily_id'],
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

  factory DailyWeather.fromDb(DailyWeatherData data) {
    return DailyWeather(
        daily_id: data.daily_id,
        location_id: data.location_id,
        date: data.date,
        temp_max: data.temp_max,
        temp_min: data.temp_min,
        condition: data.condition,
        description: data.description,
        icon: data.icon,
        precip_prob: data.precip_prob,
        sunrise: data.sunrise,
        sunset: data.sunset,
        state: data.state
    );
  }
}
