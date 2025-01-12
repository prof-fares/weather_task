import 'dart:developer';

import 'package:weather_task/modules/weather_module.dart/domain/entities/weather_entity.dart';

import 'clouds.dart';
import 'coord.dart';
import 'main.dart';
import 'sys.dart';
import 'weather.dart';
import 'wind.dart';

class WeatherModel  extends WeatherEntity {
	Coord? coord;
	List<Weather>? weather;
	String? base;
	Main? main;
	int? visibility;
	Wind? wind;
	Clouds? clouds;
	int? dt;
	Sys? sys;
	int? timezone;
	int? weatherId;
	String? name;
	int? cod;

	WeatherModel({
		this.coord, 
		this.weather, 
		this.base, 
		this.main, 
		this.visibility, 
		this.wind, 
		this.clouds, 
		this.dt, 
		this.sys, 
		this.timezone, 
		this.weatherId, 
		this.name, 
		this.cod, 
	}) : super(
          cityName: name??"unknowen",
          temperature: main?.temp??0.0,
          condition:weather?[0].main??"unknowen",
          humidity:  main?.humidity??0,
          windSpeed: wind?.speed??0.0,
          id: weatherId.toString(),
        );
factory WeatherModel.fromJson(Map<String, dynamic> json) {
  try {
    log("Parsing WeatherModel...");
    log("Coord: ${json['coord']}");
    log("Weather: ${json['weather']}");
    log("Main: ${json['main']}");
    log("ID: ${json['id']}");

    return WeatherModel(
      coord: json['coord'] == null ? null : Coord.fromJson(json['coord']),
      weather: (json['weather'] as List?)
          ?.map((e) => Weather.fromJson(e.cast<String, dynamic>())) 
          .toList(),
      base: json['base'] as String?,
         main: json['main'] == null ? null : Main.fromJson(json['main'].cast<String, dynamic>()),
       visibility: json['visibility'] as int?,
       wind: json['wind'] == null ? null : Wind.fromJson(json['wind'].cast<String, dynamic>()),
       clouds: json['clouds'] == null ? null : Clouds.fromJson(json['clouds'].cast<String, dynamic>()),
      dt: json['dt'] as int?,
       sys: json['sys'] == null ? null : Sys.fromJson(json['sys']),
       timezone: json['timezone'] as int?,
       weatherId: json['id'] is int ? json['id'] as int : int.tryParse(json['id']?.toString() ?? '') ?? 0,
       name: json['name'] as String?,
       cod: json['cod'] as int?,
    );
  } catch (e, stackTrace) {
    log("Error parsing WeatherModel: $e");
    log("Stack trace: $stackTrace");
    throw Exception("Failed to parse WeatherModel: $e");
  }
}
	Map<String, dynamic> toJson() => {
				'coord': coord?.toJson(),
				'weather': weather?.map((e) => e.toJson()).toList(),
				'base': base,
				'main': main?.toJson(),
				'visibility': visibility,
				'wind': wind?.toJson(),
				'clouds': clouds?.toJson(),
				'dt': dt,
				'sys': sys?.toJson(),
				'timezone': timezone,
				'id': id,
				'name': name,
				'cod': cod,
			};
}
