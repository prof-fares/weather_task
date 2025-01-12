import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_task/mini_core/common_widgets/custom_app_bar.dart';
import 'package:weather_task/mini_core/resource_manger.dart/app_gradient.dart';
import 'package:weather_task/mini_core/static/app_strings.dart';
import 'package:weather_task/modules/weather_module.dart/presentation/getX/weather_controller.dart';
import 'package:weather_task/modules/weather_module.dart/presentation/views/home/widgets/empty_state.dart';
import 'package:weather_task/modules/weather_module.dart/presentation/views/home/widgets/home_floating_button.dart';
import 'package:weather_task/modules/weather_module.dart/presentation/views/home/widgets/weather_list.dart';
import 'package:weather_task/modules/weather_module.dart/presentation/views/search/search_page.dart';

class HomePage extends GetView<WeatherController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GradientAppBar(title: AppStrings.homeTitle),
      body: Container(
        decoration: const BoxDecoration(
          gradient:AppGradient.backGroundGradient
        ),
        child: Obx(() {
          if (controller.isLoading) {
            return const Center(child: CircularProgressIndicator(color: Colors.white));
          }

          if (controller.savedWeather.isEmpty) {
            return const EmptyStateWidget();
          }

          return WeatherListWidget(controller: controller);
        }),
      ),
      floatingActionButton: const HomeFloatingButton(),
    );
  }
}
