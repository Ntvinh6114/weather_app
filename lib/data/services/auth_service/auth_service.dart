import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthService extends GetxService {
  final _box = GetStorage();

  // key định danh dữ liệu
  final _tokenKey = 'auth_token';
  final _isLoggedInKey = 'is_logged_in';

  Future<AuthService> init() async {
    return this;
  }

  Future<void> saveAuthData(String token) async {
    await _box.write(_tokenKey, token);
    await _box.write(_isLoggedInKey, true);
  }

  String getToken() => _box.read(_tokenKey);
  bool isLoggedIn() => _box.read(_isLoggedInKey);

  Future<void> clearAuthData() async {
    await _box.remove(_tokenKey);
    await _box.remove(_isLoggedInKey);
  }
}