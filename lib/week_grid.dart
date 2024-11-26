import 'package:flutter/material.dart';
import 'package:life_logger/models/calendar_info/day_info.dart';
import 'package:life_logger/models/calendar_info/weather.dart';
import 'package:life_logger/theme.dart';
import 'package:life_logger/utils.dart';


DayInfo tempDayInfo = DayInfo(
  date: DateTime.now(),
  day: 1,
  weekday: 1,
  dailyWeather: DailyWeather(
    date: DateTime.now(),
    weatherCode: 1,
    temperatureMax: 20,
    temperatureMin: 10,
    daylightDuration: 10,
    precipitationSum: 0.0,
    windSpeedMax: 2.0,
    hourlyWeathers: [
      HourlyWeather(
        timestamp: DateTime.now(),
        temperature: 15,
        relativeHumidity: 50,
        apparentTemperature: 16,
        precipitation: 0.0,
        weatherCode: 1,
        pressureMsl: 1013,
        cloudCover: 20,
        windSpeed: 2.0,
        windDirection: 180,
      ),
      HourlyWeather(
        timestamp: DateTime.now().add(const Duration(hours: 1)),
        temperature: 16,
        relativeHumidity: 50,
        apparentTemperature: 17,
        precipitation: 0.0,
        weatherCode: 1,
        pressureMsl: 1013,
        cloudCover: 20,
        windSpeed: 2.0,
        windDirection: 180,
      ),
    ]
  ),
  note: Note(
    date: DateTime.now(),
    note: '今日は晴れです。',
    title: '天気',
  ),
  events: [
    DayEvent(
      date: DateTime.now(),
      title: '会議',
      description: '部長との会議',
      location: '会議室',
      startTime: DateTime.now(),
      endTime: DateTime.now().add(const Duration(hours: 1)),
    ),
    DayEvent(
      date: DateTime.now(),
      title: '昼食',
      description: 'ランチ',
      location: '社員食堂',
      startTime: DateTime.now().add(const Duration(hours: 1)),
      endTime: DateTime.now().add(const Duration(hours: 2)),
    ),
    DayEvent(
      date: DateTime.now(),
      title: '打ち合わせ',
      description: '営業部との打ち合わせ',
      location: '会議室',
      startTime: DateTime.now().add(const Duration(hours: 2)),
      endTime: DateTime.now().add(const Duration(hours: 3)),
    ),
  ],
);

class DayGrid extends StatefulWidget {
  final DayInfo dayInfo;
  final double? height;
  final double? width;

  const DayGrid({
    super.key,
    required this.dayInfo,
    this.height,
    this.width,
  });

  @override
  _DayGridState createState() => _DayGridState();
}

class _DayGridState extends State<DayGrid> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CommonInfoGrid(
          height: widget.height ?? 200,
          width: widget.width ?? 200,
          child: Text('日付: ${widget.dayInfo.date}'),
        )
      ],
    );
  }
}

class CommonInfoGrid extends StatelessWidget {
  final Widget child;
  final double? height;
  final double? width;

  const CommonInfoGrid({super.key, required this.child, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: SpecifyColors.thinGrey,
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(calcAdjustedValue(12)),
      ),
      child: Container(
        height: height ?? 200,
        width: width ?? 200,
        child: child,
      ),
    );
  }
}

class WeekGrid extends StatelessWidget {
  final List<DayInfo> dayInfos = [tempDayInfo];

  WeekGrid({super.key});

  Map<String, int> getResponsiveWidth(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    // 横幅
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      scrollDirection: Axis.horizontal,
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return DayGrid(
                dayInfo: dayInfos[0],
                height: getResponsiveWidth(context)['height'] as double,
                width: getResponsiveWidth(context)['width'] as double,
              );
            },
            childCount: 7,
          ),
        ),
      ],
    );
  }
}