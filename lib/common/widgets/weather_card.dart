import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'glass_box.dart';

class WeatherCard<T> extends StatelessWidget {
  final Widget Function(T weather) builder;
  final Rx<T?> rx;

  const WeatherCard({
    super.key,
    required this.rx,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return GlassBox(
      child: Obx(() {
        final data = rx.value;

        if (data == null) {
          return const SizedBox(
            height: 100,
            child: Center(child: Text("...")),
          );
        }

        return builder(data);
      }),
    );
  }
}

