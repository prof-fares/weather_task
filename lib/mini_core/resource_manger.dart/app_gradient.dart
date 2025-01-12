import 'package:flutter/material.dart';

abstract class AppGradient {
static const backGroundGradient=   LinearGradient(
            colors: [Color(0xFF6DD5FA), Color(0xFF2980B9)], // خلفية متدرجة
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          );
          static const appBarGradient=   LinearGradient(
            colors: [Color(0xFF2980B9), Color(0xFF6DD5FA)], // Gradient لـ AppBar
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          );
}