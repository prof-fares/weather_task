import 'package:flutter/material.dart';
import 'package:weather_task/mini_core/static/app_strings.dart';

class SearchInputWidget extends StatelessWidget {
  final TextEditingController controller;
    final Function(String)? onChanged;

  const SearchInputWidget({
    Key? key,
    required this.controller, this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: AppStrings.cityName,
        labelStyle: const TextStyle(color: Colors.white70),
        filled: true,
        fillColor: Colors.white.withOpacity(0.1),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.white, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),
      style: const TextStyle(color: Colors.white),
        onChanged: onChanged, 
    );
  }
}
