import 'package:flutter/material.dart';
import 'package:weather_task/mini_core/utils.dart/responsive_utill.dart';


extension PaddingExtension on Widget {
  Widget myAllPadding(double value) => Padding(
        padding: EdgeInsets.all(value),
        child: this,
      );
  Widget PW16() => Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getHorizontalSize(16),
        ),
        child: this,
      );
  Widget PW9() => Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getHorizontalSize(9),
        ),
        child: this,
      );
  Widget PW24() => Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getHorizontalSize(24),
        ),
        child: this,
      );
  Widget PW28() => Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getHorizontalSize(28),
        ),
        child: this,
      );
  Widget PW37() => Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getHorizontalSize(37),
        ),
        child: this,
      );
  Widget PW53() => Padding(
        padding: EdgeInsets.symmetric(horizontal: getHorizontalSize(53)),
        child: this,
      );
  Widget myAllPaddingSymmetric(
          {double horizontal = 0.0, double vertical = 0.0}) =>
      Padding(
        padding:
            EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
        child: this,
      );

  Widget myAllPaddingOnly(
          {double left = 0.0,
          double top = 0.0,
          double right = 0.0,
          double bottom = 0.0}) =>
      Padding(
        padding:
            EdgeInsets.only(left: left, top: top, right: right, bottom: bottom),
        child: this,
      );
}
