// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:weather_app/data/services/location_service/get_location.dart';
//
//
// class App extends StatelessWidget {
//   App({super.key});
//
//   final location = LocationService();
//   late Position? result = await location.getLocation();
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('text'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(result.toString()),
//           ],
//         ),
//       )
//     );
//   }
// }
//
//
// void main() {
//
//   runApp(App());
// }
//
import 'package:flutter/material.dart';

import 'data/services/location_service/get_location.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  String result = "Chưa có dữ liệu";

  final LocationService locationService = LocationService();

  Future<void> loadPosition() async {
    final position = await locationService.getLocation();

    setState(() {
      if (position == null) {
        result = "Không có giá trị";
      } else {
        result = "${position.latitude} - ${position.longitude}";
      }
    });
  }

  @override
  void initState() {
    super.initState();
    loadPosition(); // gọi khi app chạy
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Location')),
        body: Center(
          child: Text(result),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: loadPosition,
          child: const Icon(Icons.refresh),
        ),
      ),
    );
  }
}

void main() {
  runApp(const App());
}
