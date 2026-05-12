import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:weather_app/app/pages/controllers/location_controller.dart';
import 'package:weather_app/app/routes/app_routes.dart';
import 'package:weather_app/common/values/constants.dart';
import 'package:weather_app/data/models/hourly_weather.dart';
import 'package:weather_app/utils/background_over_time.dart';

class LocationCard extends StatelessWidget {
  final MapEntry<String, HourlyWeather> value;
  
  const LocationCard({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    final name = value.key;

    final locationCtrl = Get.find<LocationController>();

    return Slidable(
      key: Key(value.value.location_id),
      endActionPane: ActionPane(
          motion: const ScrollMotion(),
          extentRatio: 0.25,
          children: [
            (locationCtrl.curLocation.value == value.value.location_id)
            ? CustomSlidableAction(
              backgroundColor: Colors.transparent,
              onPressed: (context) {  },
              child: Container(
                margin: const EdgeInsets.all(Constants.padding),
                decoration: BoxDecoration(
                    color: Color(0xFF9C9C9C),
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Center(child: Icon(Icons.close, size: Constants.iconSize)),
              ),
            )
            : CustomSlidableAction(
                onPressed: (context) {
                  locationCtrl.deleteLocation(value.value.location_id);
                },
                backgroundColor: Colors.transparent,
                child: Container(
                  margin: const EdgeInsets.all(Constants.padding),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Center(child: Icon(Icons.delete, size: Constants.iconSize,)),
                )
            )
          ]
      ),
      child: Padding(
        padding: const EdgeInsets.all(Constants.padding),
        child: GestureDetector(
          onTap: () {
            locationCtrl.changeDefault(value.value.location_id);
            Get.offNamed(AppRoutes.home);
          },
          child: Container(
            padding: EdgeInsets.all(Constants.padding),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: backgroundOverTime(null, null)
              )
            ),
            height: 110,
            child: Center(
              child: Row(
                children: [
                  Expanded(flex: 3, child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                            text: name, style: Constants.subtitle
                        ),
                        WidgetSpan(
                            child: (locationCtrl.selectedLocation.value!.location_id == value.value.location_id)
                                ? Icon(Icons.location_on, size: Constants.iconSize)
                                : SizedBox()
                        )
                      ]
                    )
                  )),
                  Expanded(
                    flex: 1,
                    child: Image.asset(assetImagePath(value.value.icon))
                  )
                ],
              )
            ),
          ),
        ),
      ),
    );
  }
}
