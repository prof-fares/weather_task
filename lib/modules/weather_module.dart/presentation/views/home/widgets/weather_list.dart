import 'package:flutter/material.dart';
import 'package:weather_task/mini_core/utils.dart/responsive_utill.dart';
import 'package:weather_task/modules/weather_module.dart/presentation/getX/weather_controller.dart';
import 'package:weather_task/modules/weather_module.dart/presentation/views/home/widgets/weather_card.dart';

class WeatherListWidget extends StatelessWidget {
  final WeatherController controller;

  const WeatherListWidget({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding:  EdgeInsets.all(getHorizontalSize(16)),
      itemCount: controller.savedWeather.length,
      separatorBuilder: (context, index) =>  Divider(height: getVerticalSize(16)),
      itemBuilder: (context, index) {
        final weather = controller.savedWeather[index];
        return WeatherCardWidget(weather: weather, controller: controller);
      },
    );
  }
}