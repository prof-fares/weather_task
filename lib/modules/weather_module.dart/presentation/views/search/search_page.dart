import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_task/mini_core/common_widgets/custom_app_bar.dart';
import 'package:weather_task/mini_core/extension/spacer_extension.dart';
import 'package:weather_task/mini_core/resource_manger.dart/app_gradient.dart';
import 'package:weather_task/mini_core/static/app_strings.dart';
import 'package:weather_task/mini_core/utils.dart/responsive_utill.dart';
import 'package:weather_task/modules/weather_module.dart/presentation/views/search/search_Widgets/search_button.dart';
import 'package:weather_task/modules/weather_module.dart/presentation/views/search/search_Widgets/search_inputs.dart';
import 'package:weather_task/modules/weather_module.dart/presentation/views/search/search_Widgets/weather_result.dart';
import '../../getX/weather_controller.dart';

class SearchPage extends GetView<WeatherController> {
  // ignore: use_super_parameters
  SearchPage({Key? key}) : super(key: key);

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GradientAppBar(title: AppStrings.searchTitle), 
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppGradient.backGroundGradient
        ),
        child: Padding(
          padding:  EdgeInsets.all(getHorizontalSize(16)),
          child: Column(
            children: [
              SearchInputWidget(controller: controller.cityController,onChanged:      controller.onSearchTextChanged,),
              20.spacerHight,
              SearchButtonWidget(
                onPressed: () => controller.searchWeather(controller.cityController.text),
              ),
              20.spacerHight,
              WeatherResultWidget(controller: controller),
            ],
          ),
        ),
      ),
    );
  }
}
