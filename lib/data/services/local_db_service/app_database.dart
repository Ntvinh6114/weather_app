import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import '../../../utils/time_state.dart';
import 'package:sqflite/sqflite.dart';

part 'app_database.g.dart';


// --- ĐỊNH NGHĨA CÁC BẢNG ---

class Location extends Table {
  TextColumn get location_id => text()();
  TextColumn get location_name => text().unique()();
  TextColumn get address => text()();
  RealColumn get lat => real()();
  RealColumn get lon => real()();
  BoolColumn get is_default => boolean().withDefault(const Constant(false))();
  DateTimeColumn get last_call => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {location_id};
}

class DailyWeather extends Table {
  TextColumn get daily_id => text()();
  TextColumn get location_id => text().references(Location, #location_id)();
  DateTimeColumn get date => dateTime()();
  RealColumn get temp_max => real()();
  RealColumn get temp_min => real()();
  TextColumn get condition => text()();
  TextColumn get icon => text()();
  TextColumn get description => text()();
  RealColumn get precip_prob => real()();
  DateTimeColumn get sunrise => dateTime()();
  DateTimeColumn get sunset => dateTime()();
  TextColumn get state => textEnum<TimeState>()();

  @override
  Set<Column> get primaryKey => {daily_id};
}

class HourlyWeather extends Table {
  TextColumn get hourly_id => text()();
  TextColumn get location_id => text().references(Location, #location_id)();
  DateTimeColumn get hour => dateTime()();
  RealColumn get temp => real()();
  RealColumn get feels_like => real()();
  TextColumn get condition => text()();
  TextColumn get icon => text()();
  RealColumn get humidity => real()();
  RealColumn get precip_prob => real()();
  RealColumn get cloud_cover => real()();
  RealColumn get wind_speed => real()();
  RealColumn get pressure => real()();
  IntColumn get uv_index => integer()();
  IntColumn get aqi => integer()();
  TextColumn get state => textEnum<TimeState>()();

  @override
  Set<Column> get primaryKey => {hourly_id};
}

// --- KHỞI TẠO DATABASE ---

@DriftDatabase(tables: [Location, DailyWeather, HourlyWeather])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

// LazyDatabase _openConnection() {
//   return LazyDatabase(() async {
//     final dbFolder = await getApplicationDocumentsDirectory();
//     final file = File(p.join(dbFolder.path, 'weather.sqlite'));
//     return NativeDatabase(file);
//   });
// }

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getDatabasesPath();

    final file = File(p.join(dbFolder, 'weather.sqlite'),);
    print("DB PATH: ${file.path}");

    return NativeDatabase(
      file,
      logStatements: true,
      setup: (db) {
        db.execute('PRAGMA journal_mode=WAL;');
      }
    );
  });
}
