import 'package:flutter/material.dart';
import 'package:weather_app/utils/time_state.dart';

class DailyWeather {

  final String location_id;
  final DateTime date;
  final double temp_max;
  final double temp_min;
  final String condition;
  final String icon;
  final double precip_prob;
  final DateTime sunrise;
  final DateTime sunset;
  final TimeState state;

  DailyWeather({
    required this.location_id,
    required this.date,
    required this.temp_max,
    required this.temp_min,
    required this.condition,
    required this.icon,
    required this.precip_prob,
    required this.sunrise,
    required this.sunset,
    required this.state
  });
}
