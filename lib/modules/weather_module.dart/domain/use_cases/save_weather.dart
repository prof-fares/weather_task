
import 'package:dartz/dartz.dart';
import 'package:weather_task/mini_core/error/failures.dart';
import 'package:weather_task/mini_core/use_cases/main_useCase.dart';
import 'package:weather_task/modules/weather_module.dart/domain/entities/weather_entity.dart';
import 'package:weather_task/modules/weather_module.dart/domain/repos/weather_repo.dart';

class SaveWeather implements UseCase<void, WeatherEntity> {
  final WeatherRepository repository;

  SaveWeather(this.repository);

  @override
  Future<Either<Failure, void>> call(WeatherEntity params) async {
    return await repository.saveWeather(params);
  }
}