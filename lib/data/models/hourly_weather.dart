import 'package:flutter/material.dart';
import 'package:weather_app/data/models/time_state.dart';

class HourlyWeather {

  final String hourly_id;
  final String daily_id;
  final DateTime hour;
  final double temp;
  final double feed_like;
  final String condition;
  final String icon;
  final double humidity;
  final double precip_prob;
  final double cloud_cover;
  final double wind_speed;
  final int uv_index;
  final TimeState state;

  HourlyWeather({
    required this.hourly_id,
    required this.daily_id,
    required this.hour,
    required this.temp,
    required this.feed_like,
    required this.condition,
    required this.icon,
    required this.humidity,
    required this.precip_prob,
    required this.cloud_cover,
    required this.wind_speed,
    required this.uv_index,
    required this.state,
  });
}