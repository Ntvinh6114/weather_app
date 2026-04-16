import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/app/pages/controllers/location_controller.dart';
import 'package:weather_app/common/widgets/location_card.dart';

import '../../../common/theme/app_theme.dart';
import '../../../common/values/constants.dart';
import '../../../data/models/hourly_weather.dart';

class LocationView extends GetView<LocationController> {
  const LocationView({super.key});

  @override
  Widget build(BuildContext context) {
    controller.getListCurWeather();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: Scaffold(
        appBar: AppBar(
          leadingWidth: 40,
          titleSpacing: 8,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back,
                size: Constants.iconSize,
              )
          ),
          title: Row(
            children: [
              Expanded(
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: Theme.of(context).inputDecorationTheme.fillColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextField(
                    autofocus: false,
                    decoration: InputDecoration(
                      hintText: 'Nhập địa điểm...',
                      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      isDense: true,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              SizedBox(
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text('Tìm kiếm'),
                ),
              ),
            ],
          )
          ,
        ),
        body: Obx(() {
          if (controller.listDisplayLocation.isEmpty) {
            return Padding(
              padding: const EdgeInsets.all(Constants.padding),
              child: Center(
                child: Text("Không có vị trí", style: Constants.content),
              ),
            );
          }
          else {
            List<MapEntry<String, HourlyWeather?>> listLocation = controller.listDisplayLocation;

            return ListView.builder(
              itemCount: listLocation.length,
              itemBuilder: (context, index) {
                var location = listLocation[index];

                return LocationCard(value: location);
              },
            );
          }
        }),
      ),
    );
  }
}