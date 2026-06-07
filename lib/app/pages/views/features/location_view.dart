import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/app/pages/controllers/location_controller.dart';
import 'package:weather_app/app/routes/app_routes.dart';
import 'package:weather_app/common/widgets/location_card.dart';

import '../../../../common/theme/app_theme.dart';
import '../../../../common/values/constants.dart';
import '../../../../data/models/hourly_weather.dart';

class LocationView extends GetView<LocationController> {
  const LocationView({super.key});

  @override
  Widget build(BuildContext context) {
    controller.getListCurWeather();

    var textCtrler = TextEditingController();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
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
                    controller: textCtrler,
                    onChanged: controller.onSearch,
                    autofocus: false,
                    decoration: InputDecoration(
                      hintText: 'Xã/phường-tỉnh/thành',
                      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      isDense: true,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Stack(
            children: [
              Obx(() {
                if (controller.listDisplayLocation.isEmpty) {
                  return Padding(
                    padding: const EdgeInsets.all(Constants.padding),
                    child: Center(
                      child: Text("Không có vị trí", style: Constants.content),
                    ),
                  );
                }
                else {
                  List<MapEntry<String, HourlyWeather>> listLocation = controller.listDisplayLocation;

                  return ListView.builder(
                    itemCount: listLocation.length,
                    itemBuilder: (context, index) {
                      var location = listLocation[index];

                      return LocationCard(value: location);
                    },
                  );
                }
              }),
              Obx(() {
                  if (controller.results.isEmpty || controller.results[0] == null) {
                    return SizedBox();
                  }

                  return Positioned(
                    top: 8,
                    left: 12,
                    right: 12,
                    child: Material(
                      elevation: 10,
                      borderRadius: BorderRadius.circular(16),
                      child: Container(
                        constraints: const BoxConstraints(maxHeight: 300),
                        decoration: BoxDecoration(
                          color: AppTheme.darkBgColor,
                          borderRadius: BorderRadius.circular(16)
                        ),
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: controller.results.length,
                          itemBuilder: (context, index) {
                            final item = controller.results[index];

                            if (item == null) {
                              return SizedBox.shrink();
                            }

                            return ListTile(
                              title: Text(item["name"], style: Constants.content.copyWith(fontWeight: FontWeight.normal),),
                              onTap: () {
                                controller.addLocation(item["lat"], item["lon"]);
                                controller.results.clear();
                                Get.offNamed(AppRoutes.home);
                              },
                            );
                          },
                        ),
                      ),
                    )
                  );
              },)
            ]
        ),
      ),
    );
  }
}