import 'package:flutter/material.dart';
import 'package:weather_task/mini_core/utils.dart/responsive_utill.dart';

extension SpacerExtension on num {
  Widget get spacerHight => SizedBox(
        height: getVerticalSize(toDouble()),
      );
  Widget get spacerWidth => SizedBox(
        width: getHorizontalSize(toDouble()),
      );
}

extension WidgetToSliverBox on Widget {
  SliverToBoxAdapter get toSliverBox => SliverToBoxAdapter(child: this);
}
