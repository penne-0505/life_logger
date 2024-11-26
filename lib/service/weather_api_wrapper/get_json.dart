import 'dart:convert';
import 'dart:core';
import 'package:http/http.dart' as http;
import 'package:life_logger/models/calendar_info/weather.dart';


class WeatherApiWrapper {
  final http.Client client;

  WeatherApiWrapper({http.Client? client}) : client = client ?? http.Client();

  static const String baseUrl = 'api.open-meteo.com';

  Future<Map<String, dynamic>> getWeatherJson({
    Map<String, String> parameters = const {},
    required double latitude,
    required double longitude,
    String models = 'jma_seamless',
    String timezone = 'Asia/Tokyo',
    }) async {

    // パラメータに必要な値を追加
    parameters.addAll({
      'latitude': latitude.toString(),
      'longitude': longitude.toString(),
      'timezone': timezone,
      'models': models,
    });

    final uri = Uri.https(baseUrl, '/v1/forecast', parameters);

    final response = await client.get(uri);

    if (response.statusCode != 200) {
      throw Exception('Failed to get weather json');
    }

    final json = jsonDecode(response.body) as Map<String, dynamic>;

    return json;
  }

  Future<List<HourlyWeather>> getHourlyWeather({
    required double latitude,
    required double longitude,
    String timezone = 'Asia/Tokyo',
    String forecastDays = '1',
    String pastDays = '1',
    String hourly = 'temperature_2m,relative_humidity_2m,apparent_temperature,precipitation,weather_code,pressure_msl,cloud_cover,wind_speed_10m,wind_direction_10m',
  }) async {
    // ここで取得できるのは、{'hourly': {'time': ['2024-01-01T00:00', ...], 'temperature_2m': [10.0, ...], ...}}の形
    final json = await getWeatherJson(
      latitude: latitude,
      longitude: longitude,
      timezone: timezone,
      parameters: {
        'forecast_days': forecastDays,
        'past_days': pastDays,
        'hourly': hourly,
      },
    );

    // {'2024-01-01T00:00': {'temperature': 10.0, ...}, ...}の形に変換
    final List<HourlyWeather> hourlyWeatherList = [];

    // 値を取り出す
    final times = json['hourly']['time'] as List<dynamic>;
    final temperatures = json['hourly']['temperature_2m'] as List<dynamic>;
    final humidities = json['hourly']['relative_humidity_2m'] as List<dynamic>;
    final apparentTemperatures = json['hourly']['apparent_temperature'] as List<dynamic>;
    final precipitations = json['hourly']['precipitation'] as List<dynamic>;
    final weatherCodes = json['hourly']['weather_code'] as List<dynamic>;
    final pressures = json['hourly']['pressure_msl'] as List<dynamic>;
    final cloudCovers = json['hourly']['cloud_cover'] as List<dynamic>;
    final windSpeeds = json['hourly']['wind_speed_10m'] as List<dynamic>;
    final windDirections = json['hourly']['wind_direction_10m'] as List<dynamic>;

    // リストに追加
    for (int i = 0; i < times.length; i++) {
      hourlyWeatherList.add(
        HourlyWeather(
          timestamp: DateTime.parse(times[i] as String),
          temperature: temperatures[i] as double,
          relativeHumidity: humidities[i] as int,
          apparentTemperature: apparentTemperatures[i] as double,
          precipitation: precipitations[i] as double,
          weatherCode: weatherCodes[i] as int,
          pressureMsl: pressures[i] as double,
          cloudCover: cloudCovers[i] as int,
          windSpeed: windSpeeds[i] as double,
          windDirection: windDirections[i] as int,
        ),
      );
    }

    return hourlyWeatherList;
    // >>> list[hourlyWeather1, hourlyWeather2, ...]
  }
}
