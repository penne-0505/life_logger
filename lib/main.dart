import 'package:flutter/material.dart';
import 'package:life_logger/models/calendar_info/weather.dart';
import 'package:life_logger/service/weather_api_wrapper/get_json.dart';
import 'package:life_logger/calender.dart';
import 'package:life_logger/theme.dart';
import 'package:life_logger/week_grid.dart';


void main() {
  runApp(const MainApp());
}


class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final WeatherApiWrapper weatherApiWrapper = WeatherApiWrapper();
  late Future<List<HourlyWeather>> hourlyWeathers;

  @override
  void initState() {
    super.initState();
    hourlyWeathers = weatherApiWrapper.getHourlyWeather(
      latitude: 35.6581,
      longitude: 139.7414,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const WeekViewPage(),
      theme: LogidianTheme.theme,
    );
  }
}


class WeekViewPage extends StatelessWidget {
  const WeekViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        // child: WeekGrid(dayInfos: [tempDayInfo])
        child: Padding(
          padding: EdgeInsets.only(top: 12.0),
          child: WeekGrid(),
        )
      ),
    );
  }
}
