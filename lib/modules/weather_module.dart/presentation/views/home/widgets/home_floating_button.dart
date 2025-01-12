import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_task/mini_core/routes/app_pages.dart';
import 'package:weather_task/mini_core/static/app_strings.dart';
import 'package:weather_task/mini_core/utils.dart/responsive_utill.dart';

class HomeFloatingButton extends StatelessWidget {
  const HomeFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => Get.toNamed(Routes.SEARCH),
      tooltip: AppStrings.searchWeather,
      backgroundColor: Colors.blue, 
      elevation: 6, 
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16), 
      ),
      child:  Icon(
        Icons.search,
        color: Colors.white,
        size: getFontSize(28),
      ),
    );
  }
}