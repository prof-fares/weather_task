import 'package:dartz/dartz.dart';
import '../../../../mini_core/error/failures.dart';
import '../../../../mini_core/use_cases/main_useCase.dart';
import '../entities/weather_entity.dart';
import '../repos/weather_repo.dart';

class GetWeatherByCity implements UseCase<WeatherEntity, String> {
  final WeatherRepository repository;

  GetWeatherByCity(this.repository);

  @override
  Future<Either<Failure, WeatherEntity>> call(String cityName) async {
    return await repository.getWeatherByCity(cityName);
  }
}