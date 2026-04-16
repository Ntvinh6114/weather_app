import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/app/pages/controllers/home_controller.dart';
import 'package:weather_app/app/pages/controllers/location_controller.dart';

import '../values/constants.dart';
import 'container.dart';

class HomeHeaderSection extends StatelessWidget {
  final LocationController locationCtrl;
  final HomeController homeCtrl;

  const HomeHeaderSection({
    super.key,
    required this.locationCtrl,
    required this.homeCtrl,
  });

  @override
  Widget build(BuildContext context) {
    return FullWidthContainer(
      padding: Constants.padding,
      child: Obx(() {
        final location = locationCtrl.selectedLocation.value;
        final currentDay = homeCtrl.currentDay.value;
        final desc = currentDay?.description ?? "...";

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              location?.location_name ?? 'chưa có vị trí...',
              style: Constants.title,
            ),
            Text(desc, style: Constants.content),
          ],
        );
      }),
    );
  }
}