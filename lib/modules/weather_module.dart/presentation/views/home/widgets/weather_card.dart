import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_task/mini_core/resource_manger.dart/app_styles.dart';
import 'package:weather_task/mini_core/routes/app_pages.dart';
import 'package:weather_task/mini_core/utils.dart/responsive_utill.dart';
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
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF6DD5FA), Color(0xFF2980B9)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          contentPadding:  EdgeInsets.all(getHorizontalSize(16)),
          title: Text(
            weather.cityName,
            style:  AppStyles.headerStyleLarge
          ),
          subtitle: Text(
            '${weather.temperature}°C - ${weather.condition}',
            style:  AppStyles.labelStyleLarge
          ),
          trailing: IconButton(
            icon: const Icon(Icons.delete, color: Colors.white),
            onPressed: () => controller.deleteWeatherEntry(weather.id),
          ),
          onTap: () => Get.toNamed(Routes.DETAILS, arguments: weather),
        ),
      ),
    );
  }
}