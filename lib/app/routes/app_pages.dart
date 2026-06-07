import 'package:get/get.dart';
import 'package:weather_app/app/pages/bindings/auth_binding.dart';
import 'package:weather_app/app/pages/bindings/chat_binding.dart';
import 'package:weather_app/app/pages/bindings/home_binding.dart';
import 'package:weather_app/app/pages/bindings/hour_binding.dart';
import 'package:weather_app/app/pages/bindings/location_binding.dart';
import 'package:weather_app/app/pages/views/auth/change_password_view.dart';
import 'package:weather_app/app/pages/views/auth/login_view.dart';
import 'package:weather_app/app/pages/views/auth/profile_view.dart';
import 'package:weather_app/app/pages/views/auth/register_view.dart';
import 'package:weather_app/app/pages/views/auth/verify_view.dart';
import 'package:weather_app/app/pages/views/features/chat_view.dart';
import 'package:weather_app/app/pages/views/features/home_view.dart';
import 'package:weather_app/app/pages/views/features/hour_view.dart';
import 'package:weather_app/app/pages/views/features/location_view.dart';

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
    ),
    GetPage(
      name: '/register',
      page: () => RegisterView(),
      binding: AuthBinding()
    ),
    GetPage(
      name: '/login',
      page: () => LoginView(),
      binding: AuthBinding()
    ),
    GetPage(
      name: '/verify',
      page: () => VerifyView(),
      binding: AuthBinding()
    ),
    GetPage(
      name: '/password',
      page: () => ChangePasswordView(),
      binding: AuthBinding()
    ),
    GetPage(
      name: '/profile',
      page: () => ProfileView(),
      binding: AuthBinding()
    ),
    GetPage(
      name: '/chat',
      page: () => ChatView(),
      binding: ChatBinding()
    )
  ];
}