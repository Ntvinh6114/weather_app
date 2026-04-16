import 'package:get/get.dart';
import 'package:weather_app/app/pages/bindings/home_binding.dart';
import 'package:weather_app/app/pages/bindings/hour_binding.dart';
import 'package:weather_app/app/pages/bindings/location_binding.dart';
import 'package:weather_app/app/pages/views/home_view.dart';
import 'package:weather_app/app/pages/views/hour_view.dart';
import 'package:weather_app/app/pages/views/location_view.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: '/home',
      page: () => HomeView(),
      binding: HomeBinding()
    ),
    GetPage(
      name: '/location',
      page: () => LocationView(),
      binding: LocationBinding()
    ),
    GetPage(
      name: '/hour',
      page: () => HourView(),
      binding: HourBinding()
    )
  ];
}