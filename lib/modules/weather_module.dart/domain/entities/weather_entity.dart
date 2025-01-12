class WeatherEntity {
  final String cityName;
  final double temperature;
  final String condition;
  final int humidity;
  final double windSpeed;
  final String id;

  WeatherEntity({
    required this.cityName,
    required this.temperature,
    required this.condition,
    required this.humidity,
    required this.windSpeed,
    required this.id,
  });
}