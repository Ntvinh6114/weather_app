import 'package:get/get.dart';
import 'package:weather_app/app/pages/controllers/location_controller.dart';
import 'package:weather_app/data/models/hourly_weather.dart';
import 'package:weather_app/data/models/location.dart';
import 'package:weather_app/data/providers/weather_api.dart';
import 'package:weather_app/data/services/local_db_service/app_database.dart' hide Location, HourlyWeather;
import 'package:weather_app/data/services/location_service/get_location.dart';

class HourController extends GetxController {
  final AppDatabase _localDb;
  final WeatherAPI _wa;
  final LocationService _ls;

  HourController(this._localDb, this._wa, this._ls);

  var day = DateTime(2026).obs;
  var location = Rx<Location>(Get.find<LocationController>().selectedLocation.value!);

  var hourSelected = 0.obs;
  var listHourly = Rx<List<HourlyWeather>>([]);


  @override
  void onReady() async {
    day.value = Get.arguments['day'];
    location.value = Get.arguments['location'];

    await getWeather(location.value);
  }

  Future<void> getWeather(Location location) async {
    listHourly.value = _wa.listHourly
        .where((e) {
          int day = e.hour.day;
          int month = e.hour.month;
          int year = e.hour.year;

          return (
              day == this.day.value.day
              && month == this.day.value.month
              && year == this.day.value.year
          );
        },)
        .toList();
  }
}