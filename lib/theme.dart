import 'package:flutter/material.dart';

/// this is not complete
class LogidianTheme {
  static ThemeData get theme {
    return ThemeData(
      primaryColor: const Color(0xff774dff),
      scaffoldBackgroundColor: const Color(0xffffffff),
      dividerColor: const Color(0xffeeeeee),
      shadowColor: const Color(0x33000000),
      iconTheme: const IconThemeData(
        color: Color(0xff666666),
      ),
    );
  }
}


/// 色を参照する時に使う(テーマで自動配色できなかったところなどに)
class SpecifyColors {
  static const Color primary = Color(0xff774dff);
  static const Color attention = Color(0xFFCC4536);
  static const Color success = Color(0xFF399D70);
  static const Color white = Color(0xffffffff);
  static const Color black = Color(0xff1e1e1e);
  static const Color thinGrey = Color(0xfff9f9f9);
  static const Color grey = Color(0xffeeeeee);
  static const Color tickGrey = Color(0xff666666);
  static const Color shadow = Color(0x33000000);
  static const Color overlay = Color(0x66000000);
}


/*
primary: 0xff774dff // メインカラー
attention: 0xFFCC4536 // 警告色(通知、エラーとか)
success: 0xFF399D70 // 成功色(通知、エラーとか)
white: 0xffffffff // 背景色とか
black: 0xff1e1e1e // 強調するテキスト、選択中のテキストとか
thinGrey: 0xfffbfbfb // コンテナの背景色とか
grey: 0xffeeeeee // 薄い線とか
tickGrey: 0xff666666 // テキストとか
shadow: 0x33000000 // 影
overlay: 0x66000000 // オーバーレイ
link: 0xFF525AF4 // リンク
 */