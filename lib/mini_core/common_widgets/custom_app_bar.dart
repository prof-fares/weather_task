import 'package:flutter/material.dart';
import 'package:weather_task/mini_core/resource_manger.dart/app_gradient.dart';
import 'package:weather_task/mini_core/resource_manger.dart/app_styles.dart';

class GradientAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const GradientAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: AppStyles.appBarStyle 
      ),
      centerTitle: true,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient:AppGradient.appBarGradient
        ),
      ),
      elevation: 10, // إضافة ظل
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}