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
    return Scaffold(
      body: Center(
        // child: WeekGrid(dayInfos: [tempDayInfo])
        // child: Padding(
        //   padding: EdgeInsets.only(top: 12.0),
        //   child: WeekGrid(),
        child:Container(
          width: 200,
          height: 200,
          alignment: Alignment.center,
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xfff9f9ff),
              borderRadius: BorderRadius.circular(100),
              boxShadow: [
                const BoxShadow(
                  color: Color(0x7fa0c4ff),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(3, 3),
                ),
                const BoxShadow(
                  color: Color(0xffffffff),
                  spreadRadius: 4,
                  blurRadius: 6,
                  offset: Offset(-3, -3),

                )
              ],
            ),
          ),
        )
        )
    );
  }
}