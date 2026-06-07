import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:weather_app/app/pages/bindings/location_binding.dart';
import 'package:weather_app/app/pages/controllers/auth_controller.dart';
import 'package:weather_app/app/routes/app_pages.dart';
import 'package:weather_app/common/theme/app_theme.dart';
import 'package:weather_app/data/providers/my_api.dart';
import 'package:weather_app/data/providers/reverse_location_api.dart';
import 'package:weather_app/data/providers/weather_api.dart';
import 'package:weather_app/app/routes/app_routes.dart';
import 'package:weather_app/data/services/location_service/get_location.dart';

import 'data/services/local_db_service/database_service.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  await Get.putAsync(() => DatabaseService().init());
  Get.lazyPut<WeatherAPI>(() => WeatherAPI());
  Get.lazyPut<ReverseLocationApi>(() => ReverseLocationApi());
  Get.lazyPut<LocationService>(() => LocationService());
  Get.lazyPut<MyApi>(() => MyApi());
  Get.lazyPut<AuthController>(() => AuthController());

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
      theme: AppTheme.darkTheme,
    );
  }
}