// lib/core/di/injection_container.dart
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

import 'package:hive/hive.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:weather_task/mini_core/services/networking/dio_factory.dart';
import 'package:weather_task/modules/weather_module.dart/data/data_source/local/weather_local_DS.dart';
import 'package:weather_task/modules/weather_module.dart/data/data_source/remote/weather_remote_Ds.dart';
import 'package:weather_task/modules/weather_module.dart/domain/repos/weather_repo.dart';
import 'package:weather_task/modules/weather_module.dart/domain/use_cases/delete_weather.dart';
import 'package:weather_task/modules/weather_module.dart/domain/use_cases/get_by_city_useCase.dart';
import 'package:weather_task/modules/weather_module.dart/domain/use_cases/get_saved_weather.dart';
import 'package:weather_task/modules/weather_module.dart/domain/use_cases/save_weather.dart';

import 'mini_core/services/networking/network_info.dart';
import 'modules/weather_module.dart/data/repo_impl/weather_repo_impl.dart';
import 'modules/weather_module.dart/presentation/getX/weather_controller.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  // External
  
  final box = await Hive.openBox<Map>('weather_box');
  sl.registerLazySingleton<Box<Map>>(() => box);
  sl.registerLazySingleton<DioClient>(() => DioClient());
  sl.registerLazySingleton<InternetConnectionChecker>(
    () => InternetConnectionChecker.createInstance(),
  );  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  // Data sources
  sl.registerLazySingleton<WeatherRemoteDataSource>(
    () => WeatherRemoteDataSourceImpl(
      client: sl(),
      apiKey: "639b44077212b1b70b55888140442ff0",
    ),
  );

  sl.registerLazySingleton<WeatherLocalDataSource>(
    () => WeatherLocalDataSourceImpl(weatherBox: sl()),
  );

  // Repository
  sl.registerLazySingleton<WeatherRepository>(
    () => WeatherRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => GetWeatherByCity(sl()));
  sl.registerLazySingleton(() => GetSavedWeather(sl()));
  sl.registerLazySingleton(() => SaveWeather(sl()));
  sl.registerLazySingleton(() => DeleteWeather(sl()));
}
class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      WeatherController(
        getWeatherByCity: sl<GetWeatherByCity>(),
        getSavedWeather: sl<GetSavedWeather>(),
        saveWeather: sl<SaveWeather>(),
        deleteWeather: sl<DeleteWeather>(),
      ),
    );
  }
}
