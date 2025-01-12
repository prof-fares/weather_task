import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_task/mini_core/extension/spacer_extension.dart';
import 'package:weather_task/mini_core/resource_manger.dart/app_styles.dart';
import 'package:weather_task/mini_core/static/app_strings.dart';
import 'package:weather_task/mini_core/utils.dart/responsive_utill.dart';
import 'package:weather_task/modules/weather_module.dart/domain/entities/weather_entity.dart';
import 'package:weather_task/modules/weather_module.dart/presentation/getX/weather_controller.dart';
import 'package:weather_task/modules/weather_module.dart/presentation/views/detail/detail_widgets.dart/build_detail_row.dart';

class WeatherDetailsCard extends StatelessWidget {
  final WeatherEntity weather;
  final WeatherController controller;

  const WeatherDetailsCard({
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
        padding:  EdgeInsets.all(getHorizontalSize(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              weather.cityName,
              style:AppStyles.headerStyleSmall
            ),
          16.spacerHight,
            BuildDetailRow(icon:Icons.thermostat, label:AppStrings.temperature, value:'${weather.temperature}°C'),
            BuildDetailRow(icon:Icons.cloud,label: AppStrings.condition,value: weather.condition),
            BuildDetailRow(icon:Icons.water_drop, label:AppStrings.humidity,value: '${weather.humidity}%'),
            BuildDetailRow(icon:Icons.air, label:AppStrings.windSpeed,value: '${weather.windSpeed} m/s'),
          16.spacerHight,
            Center(
              child: ElevatedButton(
                onPressed: () {
                  controller.deleteWeatherEntry(weather.id);
                  Get.back();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding:  EdgeInsets.symmetric(horizontal: getHorizontalSize(32), vertical: getVerticalSize(12)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child:  Text(
                  'Delete Entry',
                  style: AppStyles.headerStyleMidium
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }}