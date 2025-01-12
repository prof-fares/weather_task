
import 'dart:developer';

import 'package:hive/hive.dart';
import 'package:weather_task/mini_core/error/exceptions.dart';
import 'package:weather_task/modules/weather_module.dart/data/models/weather_model/weather_model.dart';
abstract class WeatherLocalDataSource {
  Future<List<WeatherModel>> getSavedWeather();
  Future<void> saveWeather(WeatherModel weather);
  Future<void> deleteWeather(String id);
}
class WeatherLocalDataSourceImpl implements WeatherLocalDataSource {
  final Box<Map> weatherBox;

  WeatherLocalDataSourceImpl({required this.weatherBox});

 @override
Future<List<WeatherModel>> getSavedWeather() async {
  try {
    log("+++++++++++++++++++++ ${weatherBox.values.toString()}");
    return weatherBox.values
        .map((data) {
          // تحويل Map<dynamic, dynamic> إلى Map<String, dynamic>
          final Map<String, dynamic> jsonData = data.cast<String, dynamic>();
          return WeatherModel.fromJson(jsonData);
        })
        .toList();
  } catch (e) {
    log("+++++++++++++++++++++ ${e.toString()}");
    throw CacheException('Failed to get saved weather');
  }
}

  @override
  Future<void> saveWeather(WeatherModel weather) async {
    try {
      await weatherBox.put(weather.id, weather.toJson());
    } catch (e) {
      throw CacheException('Failed to save weather');
    }
  }

  @override
  Future<void> deleteWeather(String id) async {
    try {
      await weatherBox.delete(id);
    } catch (e) {
      throw CacheException('Failed to delete weather');
    }
  }
}
