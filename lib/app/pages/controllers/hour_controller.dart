import 'package:drift/drift.dart';
import 'package:get/get.dart';
import 'package:weather_app/data/models/hourly_weather.dart';
import 'package:weather_app/data/models/location.dart';
import 'package:weather_app/data/services/local_db_service/app_database.dart' hide Location, HourlyWeather;

class HourController extends GetxController {
  final AppDatabase _localDb;

  HourController(this._localDb);

  final day = Rxn<DateTime>();
  final location = Rxn<Location>();

  final hourSelected = 0.obs;
  final listHourly = RxList<HourlyWeather>([]);
  Rx<HourlyWeather> get curWeather => Rx<HourlyWeather>(listHourly[hourSelected.value]);

  @override
  void onReady() async {
    super.onReady();

    final args = Get.arguments;

    day.value = args["day"] as DateTime;
    location.value = args["location"] as Location;

    await getWeather();
  }

  Future<void> getWeather() async {
    if (day.value == null || location.value == null) return;

    final selectedDay = day.value!;

    final startOfDay = DateTime(
      selectedDay.year,
      selectedDay.month,
      selectedDay.day,
    );

    final nextDay = startOfDay.add(const Duration(days: 1));

    final result = await (_localDb.select(_localDb.hourlyWeather)
      ..where((tbl) =>
      tbl.location_id.equals(location.value!.location_id) &
      tbl.hour.isBiggerOrEqualValue(startOfDay) &
      tbl.hour.isSmallerThanValue(nextDay))
      ..orderBy([
            (tbl) => OrderingTerm(
          expression: tbl.hour,
          mode: OrderingMode.asc,
        )
      ]))
        .get();

    listHourly.value = result
        .map((e) => HourlyWeather.fromDb(e))
        .toList();

    if (listHourly.isNotEmpty) {
      hourSelected.value = 0;
    }

    print("Ngày chọn: $startOfDay");
    print("Số giờ lấy được: ${listHourly.length}");
  }

  void changeHour(int index) {
    hourSelected.value = index;
    curWeather.value = listHourly[index];
  }
}