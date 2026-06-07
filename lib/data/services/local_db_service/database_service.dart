
import 'package:get/get.dart';
import 'package:weather_app/data/services/local_db_service/app_database.dart';

class DatabaseService extends GetxService {
  late final AppDatabase database;

  Future<DatabaseService> init() async {
    database = AppDatabase();
    Get.put<AppDatabase>(database);

    // Truy vấn mồi tạo file
    try {
      await database.select(database.hourlyWeather).get();
      await database.select(database.dailyWeather).get();
      await database.select(database.location).get();
      print("Drift Database đã khởi tạo thành công!");
    } catch (e) {
      print("Lỗi khởi tạo mồi database: $e");
    }

    return this;
  }

  @override
  void onClose() {
    database.close();
    super.onClose();
  }
}