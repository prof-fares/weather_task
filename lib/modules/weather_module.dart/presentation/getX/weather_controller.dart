import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_task/mini_core/use_cases/main_useCase.dart';
import 'package:weather_task/modules/weather_module.dart/domain/entities/weather_entity.dart';
import 'package:weather_task/modules/weather_module.dart/domain/use_cases/delete_weather.dart';
import 'package:weather_task/modules/weather_module.dart/domain/use_cases/get_by_city_useCase.dart';
import 'package:weather_task/modules/weather_module.dart/domain/use_cases/get_saved_weather.dart';
import 'package:weather_task/modules/weather_module.dart/domain/use_cases/save_weather.dart';

class WeatherController extends GetxController {
  final GetWeatherByCity getWeatherByCity;
  final GetSavedWeather getSavedWeather;
  final SaveWeather saveWeather;
  final DeleteWeather deleteWeather;

  WeatherController({
    required this.getWeatherByCity,
    required this.getSavedWeather,
    required this.saveWeather,
    required this.deleteWeather,
  });

  final _isLoading = false.obs;
  final _error = ''.obs;
  final _currentWeather = Rxn<WeatherEntity>();
  final _savedWeather = <WeatherEntity>[].obs;
 final cityController = TextEditingController();
 // waiting while finish city name 3 seconds
   final Debouncer debouncer = Debouncer(seconds: 3); 
  bool get isLoading => _isLoading.value;
  String get error => _error.value;
  WeatherEntity? get currentWeather => _currentWeather.value;
  List<WeatherEntity> get savedWeather => _savedWeather;

  @override
  void onInit() {
    super.onInit();
    loadSavedWeather();
   
  }
  void onSearchTextChanged(String text) {
    debouncer.run(() {
      if (text.isNotEmpty) {
        searchWeather(text);
      } else {
        _currentWeather.value = null; 
      }
    });
  }

  Future<void> searchWeather(String cityName) async {
    _isLoading.value = true;
    _error.value = '';

    final result = await getWeatherByCity(cityName);
    result.fold(
      (failure) => _error.value = failure.message,
      (weather) => _currentWeather.value = weather,
    );

    _isLoading.value = false;
  }

  Future<void> loadSavedWeather() async {
    _isLoading.value = true;
    _error.value = '';

    final result = await getSavedWeather(NoParams());
    result.fold(
      (failure) => _error.value = failure.message,
      (weather) => _savedWeather.value = weather,
    );

    _isLoading.value = false;
  }

  Future<void> saveCurrentWeather() async {
    if (_currentWeather.value == null) return;

    final result = await saveWeather(_currentWeather.value!);
    result.fold(
      (failure) => _error.value = failure.message,
      (_) {
        loadSavedWeather();
        Get.back();
      },
    );
  }

  Future<void> deleteWeatherEntry(String id) async {
    final result = await deleteWeather(id);
    result.fold(
      (failure) => _error.value = failure.message,
      (_) => loadSavedWeather(),
    );
  }
}

class Debouncer {
  final int seconds;
  VoidCallback? action;
  Timer? _timer;

  Debouncer({required this.seconds});

  void run(VoidCallback action) {
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer(Duration(seconds: seconds), action);
  }
}