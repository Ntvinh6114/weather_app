import 'package:flutter/material.dart';
import 'common/theme/app_theme.dart';
import 'app/pages/views/auth/register_view.dart';
import 'app/pages/views/auth/login_view.dart';
import 'app/pages/views/auth/change_password_view.dart';
import 'app/pages/views/auth/verify_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auth UI Test',
      debugShowCheckedModeBanner: false,

      // Sử dụng theme tối của bạn ở đây
      theme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark, // Ép ứng dụng luôn hiển thị chế độ tối để test

      home: const ChangePasswordView(),
    );
  }
}