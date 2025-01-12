import 'package:flutter/material.dart';
import 'package:weather_task/mini_core/extension/spacer_extension.dart';
import 'package:weather_task/mini_core/resource_manger.dart/app_styles.dart';
import 'package:weather_task/mini_core/static/app_strings.dart';
import 'package:weather_task/modules/weather_module.dart/domain/entities/weather_entity.dart';
import 'package:weather_task/modules/weather_module.dart/presentation/getX/weather_controller.dart';

class WeatherCardWidget extends StatelessWidget {
  final WeatherEntity weather;
  final WeatherController controller;

  const WeatherCardWidget({
    Key? key,
    required this.weather,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              weather.cityName,
              style: AppStyles.headerStyleSmall
            ),
            8.spacerHight,
            Text(
              '${weather.temperature}°C',
              style: AppStyles.bodyStyleLarg
            ),
           8.spacerHight,
            Text(
              weather.condition,
              style: AppStyles.bodyStyleMidium 
            ),
            16.spacerHight,
            ElevatedButton(
              onPressed: controller.saveCurrentWeather,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child:  Text(
                AppStrings.save,
                style:  AppStyles.headerStyleMidium 
              ),
            ),
          ],
        ),
      ),
    );
  }
}