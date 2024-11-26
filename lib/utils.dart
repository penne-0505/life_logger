/// ContinuousRectangleBorderのraundnessを設定する際に使用
double calcAdjustedValue(double value) {
  // 1000で割って四捨五入してから1000をかけることで小数点第三位までの値を取得
  return (value * 2.35294 * 1000).round() / 1000;
}

String formatTime(DateTime time) {
  return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
}