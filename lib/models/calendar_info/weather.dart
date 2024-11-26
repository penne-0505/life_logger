class HourlyWeather {
  final DateTime timestamp; // 時刻
  final double temperature; // 気温
  final int relativeHumidity; // 相対湿度
  final double apparentTemperature; // 体感温度
  final double precipitation; // 降水量
  final int weatherCode; // 天気コード
  final double pressureMsl; // 海面気圧
  final int cloudCover; // 雲量
  final double windSpeed; // 風速
  final int windDirection; // 風向き

  HourlyWeather({
    required this.timestamp,
    required this.temperature,
    required this.relativeHumidity,
    required this.apparentTemperature,
    required this.precipitation,
    required this.weatherCode,
    required this.pressureMsl,
    required this.cloudCover,
    required this.windSpeed,
    required this.windDirection,
  });
}

class DailyWeather {
  final DateTime date;
  final List<HourlyWeather> hourlyWeathers;
  final int weatherCode;
  final double temperatureMax;
  final double temperatureMin;
  final int daylightDuration;
  final double precipitationSum;
  final double windSpeedMax;

  DailyWeather({
    required this.date,
    required this.hourlyWeathers,
    required this.weatherCode,
    required this.temperatureMax,
    required this.temperatureMin,
    required this.daylightDuration,
    required this.precipitationSum,
    required this.windSpeedMax,
  });
}