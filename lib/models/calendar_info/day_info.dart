import 'package:life_logger/models/calendar_info/weather.dart';

class DayInfo {
  final DateTime date;
  final int day;
  /// 0: 日曜日, 1: 月曜日, ..., 6: 土曜日
  final int weekday;
  final DailyWeather dailyWeather;
  Note? note;
  List<DayEvent>? events;

  DayInfo({
    required this.date,
    required this.day,
    required this.weekday,
    required this.dailyWeather,
    this.note,
    this.events,
  });
}


/// カレンダーに表示する予定
/// 
/// 予定の開始時刻と終了時刻が同じ場合は、終日の予定とする
class DayEvent {
  final DateTime date;
  final String title;
  final String description;
  /// 緯度や経度ではなく、場所の名前を入れる
  String location = '';
  /// 予定の開始時刻(日付は無視)
  /// これとendTimeもnullの場合は、終日の予定とする
  DateTime? startTime;
  /// 予定の終了時刻(日付は無視)
  /// これとstartTimeもnullの場合は、終日の予定とする
  DateTime? endTime;

  DayEvent({
    required this.date,
    required this.title,
    required this.description,
    this.location = '',
    this.startTime,
    this.endTime,
  });
}

class Note {
  final DateTime date;
  final String note;
  final String title;

  Note({
    required this.date,
    required this.note,
    required this.title,
  });
}