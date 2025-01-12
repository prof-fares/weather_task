// lib/domain/usecases/delete_weather.dart
import 'package:dartz/dartz.dart';
import 'package:weather_task/mini_core/error/failures.dart';
import 'package:weather_task/mini_core/use_cases/main_useCase.dart';
import 'package:weather_task/modules/weather_module.dart/domain/repos/weather_repo.dart';

class DeleteWeather implements UseCase<void, String> {
  final WeatherRepository repository;

  DeleteWeather(this.repository);

  @override
  Future<Either<Failure, void>> call(String params) async {
    return await repository.deleteWeather(params);
  }
}