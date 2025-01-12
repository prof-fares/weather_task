import 'package:flutter/material.dart';
import 'package:weather_task/mini_core/extension/spacer_extension.dart';
import 'package:weather_task/mini_core/resource_manger.dart/app_styles.dart';
import 'package:weather_task/mini_core/utils.dart/responsive_utill.dart';

class BuildDetailRow extends StatelessWidget {
  final String label;
  final IconData icon;
  final String value;

  const BuildDetailRow({super.key, required this.label, required this.icon, required this.value});
  @override
  Widget build(BuildContext context) {
  return  Padding(
      padding:  EdgeInsets.symmetric(vertical: getVerticalSize(8)),
      child: Row(
        children: [
          Icon(icon, color: Colors.blueGrey),
         8.spacerWidth,
          Text(
            '$label: ',
            style:AppStyles.bodyStyleSmall
          ),
          Text(
            value,
            style:AppStyles.bodyStyleSmall
          ),
        ],
      ));
  }
}