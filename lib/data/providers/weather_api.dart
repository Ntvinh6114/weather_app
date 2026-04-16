import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/common/values/api.dart';
import 'package:weather_app/data/models/daily_weather.dart';
import 'package:weather_app/data/models/hourly_weather.dart';
import 'package:weather_app/data/models/location.dart';
import 'package:weather_app/data/services/local_db_service/app_database.dart' as db;
import 'package:weather_app/utils/time_state.dart';
import 'package:get/get.dart';

class WeatherAPI {
  static final WeatherAPI _instance = WeatherAPI._internal();

  String BaseUrl = WEATHER_BASE_URL;
  String PathUrl = WEATHER_PATH_URL;
  String ApiKey = WEATHER_API_KEY;

  List<DailyWeather> listDaily = [];
  List<HourlyWeather> listHourly = [];
  HourlyWeather? current;

  DateTime? lastCall;

  bool _shouldCall() {
    if (lastCall == null) {
      lastCall = DateTime.now();
      return true;
    }

    DateTime now = DateTime.now();
    final difference = now.difference(lastCall!);

    if (difference.inMinutes >= 30) {
      lastCall = now;
      return true;
    }
    return false;
  }

  factory WeatherAPI() {
    return _instance;
  }

  WeatherAPI._internal();

  Future<void> loadDataWeather(Location location) async {
    if (!_shouldCall()) {
      print("Chưa hết tới gian gọi API.");
      return;
    }

    final double lat = location.lat;
    final double lon = location.lon;

    final timeNow = DateTime.now();
    final String now = timeNow.toIso8601String().split("T")[0];
    final String lastDay = timeNow.add(Duration(days: 14)).toIso8601String().split("T")[0];

    final url = Uri.https(BaseUrl, "$PathUrl/$lat,$lon/$now/$lastDay", {
      "key": ApiKey,
      "unitGroup": "metric",
      "include": "current,days,hours",
      "lang": "id",
      "elements": "datetime,"
          "tempmax,"
          "tempmin,"
          "sunrise,"
          "sunset,"
          "description,"
          "temp,"
          "feelslike,"
          "conditions,"
          "icon,"
          "humidity,"
          "precipprob,"
          "cloudcover,"
          "windspeed,"
          "uvindex,"
          "aqius,"
          "pressure"
    });

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        // 1. Làm sạch danh sách cũ trước khi nạp mới
        listDaily.clear();
        listHourly.clear();

        // 2. Xử lý Current Weather
        final curCon = data["currentConditions"];
        if (curCon != null) {
          // Lấy ngày đầu tiên trong danh sách để ghép cho current
          String firstDayDate = data['days'][0]['datetime'];
          curCon['datetime'] = DateTime.parse('${firstDayDate}T${curCon['datetime']}');
          curCon["location_id"] = location.location_id;
          curCon['state'] = TimeState.current;
          current = HourlyWeather.fromJson(curCon);
        }

        var days = data["days"] ?? [];
        listDaily = days.map<DailyWeather>((d) {
          d["location_id"] = location.location_id;
          d["state"] = TimeState.future;

          String currentDateStr = d['datetime'];
          d["sunrise"] = "${currentDateStr}T${d["sunrise"]}";
          d["sunset"] = "${currentDateStr}T${d["sunset"]}";

          var hours = d["hours"] ?? [];

          List<HourlyWeather> hourlyModels = hours.map<HourlyWeather>((h) {
            h["datetime"] = DateTime.parse("${currentDateStr}T${h["datetime"]}");
            h["location_id"] = location.location_id;
            h['state'] = TimeState.future;
            return HourlyWeather.fromJson(h);
          }).toList();

          listHourly.addAll(hourlyModels);

          return DailyWeather.fromJson(d);
        }).toList();

      } else {
        throw Exception('Status: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('WeatherAPI Error: $e');
    }
  }

  Future<HourlyWeather?> getCurrentWeather(Location location) async {
    final double lat = location.lat;
    final double lon = location.lon;

    final timeNow = DateTime.now();
    final String now = timeNow.toIso8601String().split("T")[0];

    final url = Uri.https(BaseUrl, "$PathUrl/$lat,$lon/$now", {
      "key": ApiKey,
      "unitGroup": "metric",
      "include": "current",
      "contentType": "json",
      "lang": "id",
      "elements": "datetime,"
          "tempmax,"
          "tempmin,"
          "sunrise,"
          "sunset,"
          "description,"
          "temp,"
          "feelslike,"
          "conditions,"
          "icon,"
          "humidity,"
          "precipprob,"
          "cloudcover,"
          "windspeed,"
          "uvindex,"
          "aqius,"
          "pressure"
    });

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final curCon = data["currentConditions"];
        if (curCon != null) {
          String dateStr = data['days'][0]['datetime'];
          curCon['datetime'] = '${dateStr}T${curCon['datetime']}';
          curCon["location_id"] = location.location_id;
          return HourlyWeather.fromJson(curCon);
        }
      }
    } catch (e) {
      throw Exception('GetCurrentWeather Error: $e');
    }

    return null;
  }
}

Future<void> updateHourData(Location location, List<HourlyWeather> listHour) async {
  // xóa thông tin cũ
  db.AppDatabase localDb = Get.find<db.AppDatabase>();

  await (localDb.delete(localDb.hourlyWeather)
  ..where((tbl) => tbl.location_id.equals(location.location_id)))
  .go();

  // cập nhật thông tin mới
  await (localDb.batch((batch) {
    batch.insertAll(localDb.hourlyWeather,
        listHour.map((e) {
          return db.HourlyWeatherCompanion
              .insert(
                hourly_id: e.weather_id,
                location_id: e.location_id,
                hour: e.hour,
                temp: e.temp,
                feels_like: e.feels_like,
                condition: e.condition,
                icon: e.icon,
                humidity: e.humidity,
                precip_prob: e.precip_prob,
                cloud_cover: e.cloud_cover,
                wind_speed: e.wind_speed,
                uv_index: e.uv_index,
                aqi: e.aqi,
                state: e.state
              );
        }
      ).toList()
    );
  }));
}

Future<void> updateDailyData(Location location, List<DailyWeather> listDaily) async {
  // xóa thông tin cũ
  db.AppDatabase localDb = Get.find<db.AppDatabase>();

  await (localDb.delete(localDb.dailyWeather)
  ..where((tbl) => tbl.location_id.equals(location.location_id)))
  .go();

  await (localDb.batch((batch) {
    batch.insertAll(
        localDb.dailyWeather,
        listDaily.map(
            (e) {
              return db.DailyWeatherCompanion.insert(
                  daily_id: e.weather_id,
                  location_id: e.location_id,
                  date: e.date,
                  temp_max: e.temp_max,
                  temp_min: e.temp_min,
                  condition: e.condition,
                  icon: e.icon,
                  description: e.description,
                  precip_prob: e.precip_prob,
                  state: e.state
              );
            },
        ).toList()
    );
  },));
}