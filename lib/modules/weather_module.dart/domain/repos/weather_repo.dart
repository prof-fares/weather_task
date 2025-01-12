import 'package:dartz/dartz.dart';

import '../../../../mini_core/error/failures.dart';
import '../../../../mini_core/use_cases/main_useCase.dart';
import '../entities/weather_entity.dart';

abstract class WeatherRepository {
  Future<Either<Failure, WeatherEntity>> getWeatherByCity(String cityName);
  Future<Either<Failure, List<WeatherEntity>>> getSavedWeather();
  Future<Either<Failure, void>> saveWeather(WeatherEntity weather);
  Future<Either<Failure, void>> deleteWeather(String id);
}

// lib/domain/usecases/get_weather_by_city.dart

