import 'package:weather_app/common/values/weather_text_vi.dart';

String generateViDescription(String des) {
  Map<String, String> desc = WeatherTextVi.desc;

  if (des.endsWith(".")) des = des.trim().substring(0, des.length - 1);
  List<String> plainDesc = des.toLowerCase().split(" ");
  String generateDesc = "";

  for (String str in plainDesc) {
    generateDesc += "${desc[str] ?? ""} ";
  }

  return generateDesc;
}