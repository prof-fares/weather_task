import 'package:weather_task/mini_core/error/exceptions.dart';
import 'package:weather_task/mini_core/services/networking/api_constants.dart';
import 'package:weather_task/mini_core/services/networking/dio_factory.dart';
import 'package:weather_task/modules/weather_module.dart/data/models/weather_model/weather_model.dart';

abstract class WeatherRemoteDataSource {
  Future<WeatherModel> getWeatherByCity(String cityName);
}

class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource {
  final DioClient client;
  final String apiKey;

  WeatherRemoteDataSourceImpl({
    required this.client,
    required this.apiKey,
  });

  @override
  Future<WeatherModel> getWeatherByCity(String cityName) async {
    final response = await client.getData(
        '${ApiEndpoints.baseUrl}/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric',
    );

    if (response.statusCode == 200) {
      return WeatherModel.fromJson(response.data);
    } else {
      throw ServerException('Failed to fetch weather data');
    }
  }
}