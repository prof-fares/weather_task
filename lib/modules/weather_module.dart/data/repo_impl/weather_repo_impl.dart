import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:weather_task/mini_core/error/exceptions.dart';
import 'package:weather_task/mini_core/error/failures.dart';
import 'package:weather_task/mini_core/services/networking/api_error_handller.dart';
import 'package:weather_task/modules/weather_module.dart/data/data_source/local/weather_local_DS.dart';
import 'package:weather_task/modules/weather_module.dart/data/data_source/remote/weather_remote_Ds.dart';
import 'package:weather_task/modules/weather_module.dart/data/models/weather_model/main.dart';
import 'package:weather_task/modules/weather_module.dart/data/models/weather_model/weather.dart';
import 'package:weather_task/modules/weather_module.dart/data/models/weather_model/weather_model.dart';
import 'package:weather_task/modules/weather_module.dart/data/models/weather_model/wind.dart';
import 'package:weather_task/modules/weather_module.dart/domain/entities/weather_entity.dart';
import 'package:weather_task/modules/weather_module.dart/domain/repos/weather_repo.dart';

import '../../../../mini_core/services/networking/network_info.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherRemoteDataSource remoteDataSource;
  final WeatherLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  WeatherRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, WeatherEntity>> getWeatherByCity(
      String cityName) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteWeather = await remoteDataSource.getWeatherByCity(cityName);
        return Right(remoteWeather);
      } on ServerException catch (e) {
        return Left(ErrorHandler.handle(e).serverFailure);
      } catch (e) {
     return   Left(ErrorHandler.handle(e).serverFailure);
      }
    } else {
      return Left(const ServerFailure(statusMessage: 'No internet connection'));
    }
  }

  @override
  Future<Either<Failure, List<WeatherEntity>>> getSavedWeather() async {
    try {
      final localWeather = await localDataSource.getSavedWeather();
      log("============== suc ===================");
      return Right(localWeather);
    } on CacheException catch (e) {
      log("============== ${e.message} ===================");
      return Left(CacheFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> saveWeather(WeatherEntity weather) async {
    try {
      await localDataSource.saveWeather(WeatherModel(
        name: weather.cityName,
        main: Main(
          temp: weather.temperature,
          humidity: weather.humidity,
        ),
        weather: [Weather(main: weather.condition)],
        wind: Wind(speed: weather.windSpeed),
        weatherId: int.parse(weather.id),
      ));
      return const Right(null);
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> deleteWeather(String id) async {
    try {
      await localDataSource.deleteWeather(id);
      return const Right(null);
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    }
  }
}
