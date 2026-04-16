import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/app/pages/controllers/hour_controller.dart';
import 'package:weather_app/common/theme/app_theme.dart';
import 'package:weather_app/common/values/constants.dart';
import 'package:weather_app/common/widgets/chart.dart';
import 'package:weather_app/common/widgets/container.dart';
import 'package:weather_app/common/widgets/glass_box.dart';


class HourView extends GetView<HourController> {
  const HourView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.arrow_back, size: Constants.iconSize)
          ),
          title: Text('Hour weather'),
        ),
        body: Obx(() => SingleChildScrollView(
          child: (controller.listHourly.value.isEmpty)
          ? Padding(
          padding: const EdgeInsets.all(Constants.padding),
            child: Center(
              child: Text("Không có dữ liệu", style: Constants.content),
            ),
          )
          : Padding(
            padding: EdgeInsets.symmetric(horizontal: Constants.padding),
            child: Column(
              children: [
                FullWidthContainer(
                  height: 300,
                  child: GlassBox(
                    child: CustomChart(
                      data: controller.listHourly.value.map(
                          (e) => DataPoint(
                              value: e.temp,
                              label: "${(e.hour.hour >= 10) ? e.hour.hour: '0${e.hour.hour}'}:${(e.hour.minute >= 10) ? e.hour.minute: '0${e.hour.minute}'}",
                              iconPath: assetImagePath(e.icon)
                          )
                      ).toList(),
                      unit: "°C",
                      onSelect: (data, index) {  },
                      tag: 'hours',
                    ),
                  )
                )
              ],
            ),
          ),
        )),
      ),
    );
  }
}