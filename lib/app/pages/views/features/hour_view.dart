import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/app/pages/controllers/hour_controller.dart';
import 'package:weather_app/common/theme/app_theme.dart';
import 'package:weather_app/common/values/constants.dart';
import 'package:weather_app/common/widgets/aqi_gauge.dart';
import 'package:weather_app/common/widgets/chart.dart';
import 'package:weather_app/common/widgets/container.dart';
import 'package:weather_app/common/widgets/content_box.dart';
import 'package:weather_app/common/widgets/glass_box.dart';
import 'package:weather_app/common/widgets/uv_gauge.dart';
import 'package:weather_app/common/widgets/weather_card.dart';
import 'package:weather_app/data/models/hourly_weather.dart';


class HourView extends GetView<HourController> {
  const HourView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.darkTheme,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.arrow_back, size: Constants.iconSize)
          ),
          title: Obx(() {
            int day = controller.day.value!.day;
            int month = controller.day.value!.month;
            int year = controller.day.value!.year;

            return Text('$day/$month/$year');
          }),
        ),
        body: Obx(()
        {
          Rx<HourlyWeather> curWeather = controller.curWeather;

          return SingleChildScrollView(
          child: (controller.listHourly.isEmpty)
              ? Padding(
                padding: const EdgeInsets.all(Constants.padding),
                child: Center(
                  child: Text("Không có dữ liệu", style: Constants.content),
                ),
              )
              : Column(
                children: [
                  FullWidthContainer(
                      padding: Constants.padding,
                      height: 300,
                      child: GlassBox(
                        child: CustomChart(
                          data: controller.listHourly.map(
                                  (e) =>
                                  DataPoint(
                                      value: e.temp,
                                      label: "${(e.hour.hour >= 10)
                                          ? e.hour.hour
                                          : '0${e.hour.hour}'}:${(e.hour.minute >= 10) ? e.hour.minute : '0${e.hour
                                          .minute}'}",
                                      iconPath: assetImagePath(e.icon)
                                  )
                          ).toList(),
                          unit: "°C",
                          onSelect: (data, index) {
                            controller.changeHour(index);
                          },
                          tag: 'hours',
                          selectable: true,
                        ),
                      )
                  ),
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
                              footer: Text("Cảm giác như: ${curWeather.value.feels_like}°C", style: Constants.content,),
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
                                            image: AssetImage(assetImagePath(curWeather.value.icon)),
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
                  Row(
                    children: [
                      HalfWidthContainer(
                          padding: Constants.padding,
                          child: WeatherCard<HourlyWeather>(
                            rx: curWeather,
                            builder: (w) =>
                                ContentBox(
                                  title: Text("UV", style: Constants.subtitle,),
                                  body: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(w.uv_index.toString(),
                                        style: Constants.info,),
                                    ],
                                  ),
                                  footer: uvDescription(w.uv_index),
                                  deco: [
                                    UVGauge(uv: w.uv_index)
                                  ],
                                ),
                          )
                      ),
                      HalfWidthContainer(
                          padding: Constants.padding,
                          child: WeatherCard<HourlyWeather>(
                            rx: curWeather,
                            builder: (w) =>
                                ContentBox(
                                  title: Text(
                                    "Độ ẩm: ", style: Constants.subtitle,),
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
                            builder: (w) =>
                                ContentBox(
                                    title: Text(
                                      "Áp suất: ", style: Constants.subtitle,),
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
                            builder: (w) =>
                                ContentBox(
                                  title: Text(
                                    "Tỉ lệ mưa: ", style: Constants.subtitle,),
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
                            builder: (w) =>
                                ContentBox(
                                    title: Text("Độ bao phủ mây: ",
                                      style: Constants.subtitle,),
                                    body: Text("${w.cloud_cover}%",
                                      style: Constants.info,)
                                ),
                          )
                      ),
                      HalfWidthContainer(
                          padding: Constants.padding,
                          child: WeatherCard(
                            rx: curWeather,
                            builder: (w) =>
                                ContentBox(
                                  title: Text(
                                    "Sức gió: ", style: Constants.subtitle,),
                                  body: Text("${w.wind_speed}",
                                    style: Constants.info,),
                                ),
                          )
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0,)
                ],
              )
          );
        }),
      ),
    );
  }
}