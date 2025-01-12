import 'package:flutter/material.dart';
import 'package:weather_task/mini_core/extension/spacer_extension.dart';
import 'package:weather_task/mini_core/resource_manger.dart/app_styles.dart';
import 'package:weather_task/mini_core/static/app_strings.dart';
import 'package:weather_task/mini_core/utils.dart/responsive_utill.dart';

class EmptyStateWidget extends StatelessWidget {
  const EmptyStateWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Icon(
            Icons.cloud_off,
            size: getFontSize(68),
            color: Colors.blueGrey,
          ),
          16.spacerHight,
           Text(
            AppStrings.noSavedItems,
            style: AppStyles.headerStyleMidium
          ),
          16.spacerHight,
          Text(
           AppStrings.deleteExample, 
            style: AppStyles.labelStyleMidium
          ),
        ],
      ),
    );
  }
}