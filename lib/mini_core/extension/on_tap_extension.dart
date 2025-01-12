import 'package:flutter/material.dart';

extension OnTapExtension on Widget {
  Widget onTap(VoidCallback onTap) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: this,
    );
  }
}
