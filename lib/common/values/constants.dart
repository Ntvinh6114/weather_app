import 'package:flutter/cupertino.dart';

class Constants {
  static const double padding = 10.0;

  // text style
  static const TextStyle title = TextStyle(fontWeight: FontWeight.bold, fontSize: 50.0);
  static const TextStyle subtitle = TextStyle(fontWeight: FontWeight.bold, fontSize: 27.0);
  static const TextStyle content = TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0);
  static const TextStyle info = TextStyle(fontWeight: FontWeight.bold, fontSize: 40.0);

  // icon
  static const  double iconSize = 35;
}

// path
String assetImagePath(String image) {
  return "assets/images/$image.png";
}