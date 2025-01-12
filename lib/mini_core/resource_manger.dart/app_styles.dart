import 'package:flutter/material.dart';
import 'package:weather_task/mini_core/utils.dart/responsive_utill.dart';

abstract class AppStyles {
  static TextStyle appBarStyle=TextStyle(
          fontSize: getFontSize(24),
          fontWeight: FontWeight.bold,
          color: Colors.white,
        );
          static TextStyle headerStyleLarge=TextStyle(
              fontSize:getFontSize(20),
              fontWeight: FontWeight.bold,
              color: Colors.white,
            );
             static TextStyle labelStyleLarge =TextStyle(
              fontSize: getFontSize(16),
              color: Colors.white70,
            );
                 static TextStyle headerStyleMidium  =TextStyle(
              fontSize:getFontSize(18),
              color: Colors.blueGrey,
              fontWeight: FontWeight.bold,
            );
            
                    static TextStyle labelStyleMidium =TextStyle(
                fontSize: getFontSize(16),
                color: Colors.blue,
              );
                  static TextStyle headerStyleSmall= TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey,
              );
                                static TextStyle bodyStyleLarg=  TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              );
static TextStyle bodyStyleMidium=TextStyle(
                fontSize: 18,
                color: Colors.grey,
              );
              static TextStyle bodyStyleSmall=TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey,
            );
        
}