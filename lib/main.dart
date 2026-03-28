import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Weather App",
      home: Text('jcxdc'),
    );
  }
}



void main() {


  runApp(App());
}

