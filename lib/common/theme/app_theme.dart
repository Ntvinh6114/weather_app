import 'package:flutter/material.dart';

class AppTheme {
  static const Color myMainColor = Color(0xFF1778F2);
  static const Color darkBgColor = Color(0xFF212121);
  static const Color lightGrey = Color(0xFFE3E3E3);
  static const Color darkGrey = Color(0xFF3A3B3C); // Màu xám cho search bar ở Dark Mode

  // --- STYLE NÚT BẤM DÙNG CHUNG ---
  static final _sharedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: myMainColor,
      foregroundColor: Colors.white,
      elevation: 0, // Search bar thường dùng nút phẳng (flat)
      shape: const StadiumBorder(), // Bo tròn stadium cho nút tìm kiếm
      textStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
    ),
  );

  // --- CẤU HÌNH SEARCH BAR THEME ---
  // Định nghĩa vẻ ngoài của SearchBar widget
  static SearchBarThemeData _searchBarTheme(bool isDark) {
    return SearchBarThemeData(
      elevation: MaterialStateProperty.all(0),
      backgroundColor: MaterialStateProperty.all(isDark ? darkGrey : lightGrey),
      shape: MaterialStateProperty.all(const StadiumBorder()),
      hintStyle: MaterialStateProperty.all(
        TextStyle(color: isDark ? Colors.grey[400] : Colors.grey[600]),
      ),
      textStyle: MaterialStateProperty.all(
        TextStyle(color: isDark ? Colors.white : Colors.black, fontSize: 14),
      ),
    );
  }

  // --- THEME SÁNG ---
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: false,
      primaryColor: myMainColor,
      secondaryHeaderColor: lightGrey,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
      ),
      elevatedButtonTheme: _sharedButtonTheme,
      // Tích hợp SearchBarTheme
      searchBarTheme: _searchBarTheme(false),
      // Cấu hình thêm cho ô nhập liệu mặc định
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: lightGrey,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  // --- THEME TỐI ---
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: false,
      brightness: Brightness.dark,
      primaryColor: myMainColor,
      secondaryHeaderColor: darkGrey,
      scaffoldBackgroundColor: darkBgColor,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      ),
      elevatedButtonTheme: _sharedButtonTheme,
      // Tích hợp SearchBarTheme cho Dark Mode
      searchBarTheme: _searchBarTheme(true),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: darkGrey,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
