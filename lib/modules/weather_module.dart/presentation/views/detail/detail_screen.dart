import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:weather_task/mini_core/common_widgets/custom_app_bar.dart';
import 'package:weather_task/mini_core/resource_manger.dart/app_gradient.dart';
import 'package:weather_task/mini_core/static/app_strings.dart';
import 'package:weather_task/mini_core/utils.dart/responsive_utill.dart';
import 'package:weather_task/modules/weather_module.dart/presentation/getX/weather_controller.dart';
import 'package:weather_task/modules/weather_module.dart/presentation/views/detail/detail_widgets.dart/weather_detail.dart';

import '../../../domain/entities/weather_entity.dart';

class DetailsPage extends GetView<WeatherController> {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final weather = Get.arguments as WeatherEntity;

    return Scaffold(
      appBar: const GradientAppBar(title: AppStrings.detailTitle), // استخدام ويدجت AppBar المخصصة
      body: Container(
        decoration: const BoxDecoration(
          gradient:AppGradient.backGroundGradient
        ),
        child: Padding(
          padding:  EdgeInsets.all(getHorizontalSize(16)),
          child: WeatherDetailsCard(weather: weather, controller: controller),
        ),
      ),
    );
  }
}
