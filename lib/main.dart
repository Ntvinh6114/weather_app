import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/app/pages/bindings/location_binding.dart';
import 'package:weather_app/app/routes/app_pages.dart';
import 'package:weather_app/data/providers/my_api.dart';
import 'package:weather_app/data/providers/reverse_location_api.dart';
import 'package:weather_app/data/providers/weather_api.dart';
import 'package:weather_app/data/services/local_db_service/app_database.dart';
import 'package:weather_app/app/routes/app_routes.dart';
import 'package:weather_app/data/services/location_service/get_location.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Get.lazyPut<AppDatabase>(() => AppDatabase());
  Get.lazyPut<WeatherAPI>(() => WeatherAPI());
  Get.lazyPut<ReverseLocationApi>(() => ReverseLocationApi());
  Get.lazyPut<LocationService>(() => LocationService());
  Get.lazyPut<MyApi>(() => MyApi());

  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: LocationBinding(),
      initialRoute: AppRoutes.home,
      getPages: AppPages.pages,
    );
  }
}