import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/app/pages/controllers/home_controller.dart';
import 'package:weather_app/app/pages/controllers/location_controller.dart';
import 'package:weather_app/app/routes/app_routes.dart';
import 'package:weather_app/common/widgets/home_header.dart';
import 'package:weather_app/common/widgets/uv_gauge.dart';
import 'package:weather_app/common/widgets/weather_card.dart';
import 'package:weather_app/common/theme/app_theme.dart';
import 'package:weather_app/common/values/constants.dart';
import 'package:weather_app/common/widgets/aqi_gauge.dart';
import 'package:weather_app/common/widgets/chart.dart';
import 'package:weather_app/common/widgets/container.dart';
import 'package:weather_app/common/widgets/content_box.dart';
import 'package:weather_app/common/widgets/glass_box.dart';
import 'package:weather_app/data/models/hourly_weather.dart';
import 'package:weather_app/utils/background_over_time.dart';

class HomeView extends GetView<HomeController> {
  HomeView({super.key});

  final locationCtrl = Get.find<LocationController>();

  @override
  Widget build(BuildContext context) {
    final curWeather = controller.currentHour;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: Obx(() => Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: backgroundOverTime(null, null),
            )
        ),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: Text("Weather App"),
               actions: [
                 IconButton(
                   onPressed: () {Get.toNamed(AppRoutes.location);},
                   icon: Icon(Icons.location_on),
                   iconSize: 35,
                 )
               ],
            ),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HomeHeaderSection(locationCtrl: locationCtrl, homeCtrl: controller),
                  Row(
                    children: [
                      HalfWidthContainer(
                        padding: Constants.padding,
                        child: WeatherCard(
                          rx: curWeather,
                          builder: (w) => ContentBox(
                            title: Text("Nhiệt độ:", style: Constants.subtitle,),
                            body: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text("${w.temp}°C", style: Constants.info,),
                              ],
                            ),
                            footer: Text("Cảm giác như: ${curWeather.value!.feels_like}°C", style: Constants.content,),
                            deco: [
                              Positioned(
                                  top: -80,
                                  right: -80,
                                  child: Container(
                                    width: 200,
                                    height: 200,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: AssetImage(assetImagePath(curWeather.value!.icon)),
                                          fit: BoxFit.cover
                                      ),
                                    ),
                                  )
                              )
                            ],
                          ),
                        )
                      ),
                      HalfWidthContainer(
                        padding: Constants.padding,
                        child: WeatherCard<HourlyWeather>(
                          rx: curWeather,
                          builder: (w) => ContentBox(
                            title: Text("AQI ", style: Constants.subtitle,),
                            body: Text(w.aqi.toString(), style: Constants.info,),
                            footer: aqiDescription(w.aqi),
                            deco: [
                              Positioned(
                                  top: -30,
                                  right: -30,
                                  child: AQIGauge(aqi: w.aqi)
                              )
                            ],
                          ),
                        )
                      )
                    ],
                  ),

                  // DỰ BÁO 24 GIỜ
                  FullWidthContainer(
                      height: 300,
                      padding: Constants.padding,
                      child: GlassBox(
                          child: ContentBox(
                            title: Text("Dự báo 24 giờ:", style: Constants.subtitle,),
                            body: (curWeather.value == null)
                                  ? Text("Đang tải...")
                                  : CustomChart(
                                    data: controller.weather24hours.map((e)
                                      => DataPoint(
                                          value: e.temp,
                                          iconPath: assetImagePath(e.icon),
                                          label: "${(e.hour.hour >= 10) ? e.hour.hour: '0${e.hour.hour}'}:${(e.hour.minute >= 10) ? e.hour.minute: '0${e.hour.minute}'}"
                                      )
                                    ).toList(),
                              unit: "°C",
                              onSelect: (data, index) {  },
                              tag: '24h',
                            ),
                          )
                      )
                  ),

                  // DỰ BÁO 14 NGÀY
                  FullWidthContainer(
                      height: 300,
                      padding: Constants.padding,
                      child: GlassBox(
                          child: ContentBox(
                            title: Text("Dự báo 14 ngày:", style: Constants.subtitle,),
                            body: (curWeather.value == null)
                              ? Text("Đang tải...")
                              : CustomChart(
                                  data: controller.weather14days.map((e)
                                  => DataPoint(
                                      value: e.temp_max,
                                      iconPath: assetImagePath(e.icon),
                                      label: "${e.date.day}/${e.date.month}"
                                  )
                                  ).toList(),
                              unit: "°C",
                              onSelect: (data, index) {
                                Get.toNamed(AppRoutes.hour,
                                    arguments: {
                                  'day': controller.weather14days[index].date,
                                  'location': locationCtrl.selectedLocation.value
                                });
                              },
                              tag: '14d',
                              selectable: true,
                            ),
                            footer: Text("Nhấn vào ngày để xem thời tiết theo giờ"),
                          )
                      )
                  ),
                  Row(
                    children: [
                      HalfWidthContainer(
                        padding: Constants.padding,
                        child: WeatherCard<HourlyWeather>(
                          rx: curWeather,
                          builder: (w) => ContentBox(
                            title: Text("UV", style: Constants.subtitle,),
                            body: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(w.uv_index.toString(),
                                  style: Constants.info,),
                              ],
                            ),
                            footer: uvDescription(w.uv_index),
                            deco: [
                              Positioned(
                                top: 100.0,
                                child: UVGauge(uv: w.uv_index)
                              )
                            ],
                          ),
                        )
                      ),
                      HalfWidthContainer(
                        padding: Constants.padding,
                        child: WeatherCard<HourlyWeather>(
                          rx: curWeather,
                          builder: (w) => ContentBox(
                            title: Text("Độ ẩm: ", style: Constants.subtitle,),
                            body: Text("${w.humidity}%",
                              style: Constants.info,),
                          ),
                        )
                      )
                    ],
                  ),
                  Row(
                    children: [
                      HalfWidthContainer(
                        padding: Constants.padding,
                        child: WeatherCard<HourlyWeather>(
                          rx: curWeather,
                          builder: (w) => ContentBox(
                              title: Text("Áp suất: ", style: Constants.subtitle,),
                              body: Text(
                                w.pressure.toString(),
                                style: Constants.info,
                              )
                          ),
                        )
                      ),
                      HalfWidthContainer(
                        padding: Constants.padding,
                        child: WeatherCard<HourlyWeather>(
                          rx: curWeather,
                          builder: (w) => ContentBox(
                            title: Text("Tỉ lệ mưa: ", style: Constants.subtitle,),
                            body: Text("${w.precip_prob}%",
                              style: Constants.info,),
                          ),
                        )
                      )
                    ],
                  ),
                  Row(
                    children: [
                      HalfWidthContainer(
                        padding: Constants.padding,
                        child: WeatherCard<HourlyWeather>(
                          rx: curWeather,
                          builder: (w) => ContentBox(
                              title: Text("Độ bao phủ mây: ", style: Constants.subtitle,),
                              body: Text("${w.cloud_cover}%",
                                style: Constants.info,)
                          ),
                        )
                      ),
                      HalfWidthContainer(
                        padding: Constants.padding,
                        child: WeatherCard(
                          rx: curWeather,
                          builder: (w) => ContentBox(
                            title: Text("Sức gió: ", style: Constants.subtitle,),
                            body: Text("${w.wind_speed}",
                              style: Constants.info,),
                          ),
                        )
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0,)
                ],
              ),
            )
        ),
      )),
    );
  }
}