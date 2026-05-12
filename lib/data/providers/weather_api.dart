import 'dart:async';
import 'dart:convert';
import 'package:drift/drift.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/common/values/api.dart';
import 'package:weather_app/data/models/location.dart';
import 'package:weather_app/data/services/local_db_service/app_database.dart' as db;
import 'package:weather_app/utils/generate_description.dart';
import 'package:weather_app/utils/time_state.dart';
import 'package:get/get.dart';

class WeatherAPI {
  String baseUrl = WEATHER_BASE_URL;
  String pathUrl = WEATHER_PATH_URL;
  String apiKey = WEATHER_API_KEY;
  String elements = WEATHER_ELEMENTS;


  Future<void> loadDataWeather(Location location) async {
    final double lat = location.lat;
    final double lon = location.lon;
    final localDb = Get.find<db.AppDatabase>();

    final timeNow = DateTime.now();
    final String now = timeNow.toIso8601String().split("T")[0];
    final String lastDay =
    timeNow.add(const Duration(days: 14)).toIso8601String().split("T")[0];

    final url = Uri.https(baseUrl, "$pathUrl/$lat,$lon/$now/$lastDay", {
      "key": apiKey,
      "unitGroup": "metric",
      "include": "current,days,hours",
      "lang": "id",
      "elements": elements
    });

    try {
      final response = await http.get(url);

      if (response.statusCode != 200) {
        throw Exception("Status: ${response.statusCode}");
      }

      final data = json.decode(response.body);

      db.HourlyWeatherCompanion? currentWeather;
      final List<db.HourlyWeatherCompanion> hourlyList = [];
      final List<db.DailyWeatherCompanion> dailyList = [];

      final currentConditions = data["currentConditions"];
      final days = data["days"] ?? [];

      if (currentConditions != null && days.isNotEmpty) {
        final firstDate = days.first["datetime"];
        final currentDateTime =
        DateTime.parse("${firstDate}T${currentConditions["datetime"]}");

        currentWeather = db.HourlyWeatherCompanion.insert(
          hourly_id: "${location.location_id}_current",
          location_id: location.location_id,
          hour: currentDateTime,
          temp: (currentConditions["temp"] ?? 0).toDouble(),
          feels_like: (currentConditions["feelslike"] ?? 0).toDouble(),
          condition: currentConditions["conditions"] ?? "",
          icon: currentConditions["icon"] ?? "",
          humidity: (currentConditions["humidity"] ?? 0).toDouble(),
          precip_prob: (currentConditions["precipprob"] ?? 0).toDouble(),
          cloud_cover: (currentConditions["cloudcover"] ?? 0).toDouble(),
          wind_speed: (currentConditions["windspeed"] ?? 0).toDouble(),
          pressure: (currentConditions["pressure"] ?? 0).toDouble(),
          uv_index: (currentConditions["uvindex"] ?? 0).toInt(),
          aqi: (currentConditions["aqius"] ?? 0).toInt(),
          state: TimeState.current,
        );
      }

      for (final d in days) {
        final dateStr = d["datetime"];

        dailyList.add(
          db.DailyWeatherCompanion.insert(
            daily_id: "${location.location_id}_$dateStr",
            location_id: location.location_id,
            date: DateTime.parse(dateStr),
            temp_max: (d["tempmax"] ?? 0).toDouble(),
            temp_min: (d["tempmin"] ?? 0).toDouble(),
            condition: d["conditions"] ?? "",
            icon: d["icon"] ?? "",
            description: generateViDescription(d["description"]),
            precip_prob: (d["precipprob"] ?? 0).toDouble(),
            state: TimeState.future,
            sunrise: DateTime.parse("${dateStr}T${d["sunrise"]}"),
            sunset: DateTime.parse("${dateStr}T${d["sunset"]}"),
          ),
        );

        final hours = d["hours"] ?? [];

        for (final h in hours) {
          final hourDate = DateTime.parse("${dateStr}T${h["datetime"]}");

          hourlyList.add(
            db.HourlyWeatherCompanion.insert(
              hourly_id: "${location.location_id}_${hourDate.toIso8601String()}",
              location_id: location.location_id,
              hour: hourDate,
              temp: (h["temp"] ?? 0).toDouble(),
              feels_like: (h["feelslike"] ?? 0).toDouble(),
              condition: h["conditions"] ?? "",
              icon: h["icon"] ?? "",
              humidity: (h["humidity"] ?? 0).toDouble(),
              precip_prob: (h["precipprob"] ?? 0).toDouble(),
              cloud_cover: (h["cloudcover"] ?? 0).toDouble(),
              wind_speed: (h["windspeed"] ?? 0).toDouble(),
              pressure: (h["pressure"] ?? 0).toDouble(),
              uv_index: (h["uvindex"] ?? 0).toInt(),
              aqi: (h["aqius"] ?? 0).toInt(),
              state: TimeState.future,
            ),
          );
        }
      }

      await localDb.transaction(() async {
        await (localDb.delete(localDb.hourlyWeather)
          ..where((tbl) => tbl.location_id.equals(location.location_id)))
            .go();

        await (localDb.delete(localDb.dailyWeather)
          ..where((tbl) => tbl.location_id.equals(location.location_id)))
            .go();

        if (currentWeather != null) {
          await localDb.into(localDb.hourlyWeather).insert(currentWeather);
        }

        await localDb.batch((batch) {
          batch.insertAll(localDb.hourlyWeather, hourlyList);
          batch.insertAll(localDb.dailyWeather, dailyList);
        });
      });
    } catch (e) {
      throw Exception("WeatherAPI Error: $e");
    }
  }


  Future<void> getCurrentWeather(Location location) async {
    final double lat = location.lat;
    final double lon = location.lon;
    final localDb = Get.find<db.AppDatabase>();

    final timeNow = DateTime.now();
    final String now = timeNow.toIso8601String().split("T")[0];

    final url = Uri.https(baseUrl, "$pathUrl/$lat,$lon/$now", {
      "key": apiKey,
      "unitGroup": "metric",
      "include": "current",
      "contentType": "json",
      "lang": "id",
      "elements": elements
    });

    try {
      final response = await http.get(url);

      if (response.statusCode != 200) {
        throw Exception("Status: ${response.statusCode}");
      }

      final data = json.decode(response.body);
      final currentConditions = data["currentConditions"];

      if (currentConditions == null) return;

      final dateStr = data["days"][0]["datetime"];
      final currentDateTime = DateTime.parse("${dateStr}T${currentConditions["datetime"]}");

      final currentWeather = db.HourlyWeatherCompanion.insert(
        hourly_id: "${location.location_id}_current",
        location_id: location.location_id,
        hour: currentDateTime,
        temp: (currentConditions["temp"] ?? 0).toDouble(),
        feels_like: (currentConditions["feelslike"] ?? 0).toDouble(),
        condition: currentConditions["conditions"] ?? "",
        icon: currentConditions["icon"] ?? "",
        humidity: (currentConditions["humidity"] ?? 0).toDouble(),
        precip_prob: (currentConditions["precipprob"] ?? 0).toDouble(),
        cloud_cover: (currentConditions["cloudcover"] ?? 0).toDouble(),
        wind_speed: (currentConditions["windspeed"] ?? 0).toDouble(),
        pressure: (currentConditions["pressure"] ?? 0).toDouble(),
        uv_index: (currentConditions["uvindex"] ?? 0).toInt(),
        aqi: (currentConditions["aqius"] ?? 0).toInt(),
        state: TimeState.current,
      );

      await localDb.transaction(() async {
        await (localDb.delete(localDb.hourlyWeather)
          ..where((tbl) =>
          tbl.location_id.equals(location.location_id) &
          tbl.state.equals(TimeState.current.name)))
            .go();

        await localDb.into(localDb.hourlyWeather).insert(currentWeather);
      });
    } catch (e) {
      throw Exception("GetCurrentWeather Error: $e");
    }
  }
}