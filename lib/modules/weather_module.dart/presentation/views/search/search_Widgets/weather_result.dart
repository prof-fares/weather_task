import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_task/modules/weather_module.dart/presentation/getX/weather_controller.dart';
import 'package:weather_task/modules/weather_module.dart/presentation/views/home/widgets/weather_card.dart';

class WeatherResultWidget extends StatelessWidget {
  final WeatherController controller;

  const WeatherResultWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading) {
        return const CircularProgressIndicator(color: Colors.white);
      }

      if (controller.error.isNotEmpty) {
        return Text(
          controller.error,
          style: const TextStyle(color: Colors.red, fontSize: 16),
        );
      }

      final weather = controller.currentWeather;
      if (weather == null) return const SizedBox();

      return WeatherCardWidget(weather: weather, controller: controller);
    });
  }
}
