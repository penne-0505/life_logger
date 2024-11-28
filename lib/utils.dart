import 'dart:ui';

import 'package:flutter/material.dart';


/// ContinuousRectangleBorderのraundnessを設定する際に使用
double calcAdjustedValue(double value) {
  // 1000で割って四捨五入してから1000をかけることで小数点第三位までの値を取得
  return (value * 2.35294 * 1000).round() / 1000;
}

String formatTime(DateTime time) {
  return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
}

/// 通常のスクロール(縦方向)を行った場合に、スクロール方向を変換する
class HorizontalScrollFromVerticalGesture extends StatefulWidget {
  @override
  _HorizontalScrollFromVerticalGestureState createState() =>
      _HorizontalScrollFromVerticalGestureState();
}

class _HorizontalScrollFromVerticalGestureState
    extends State<HorizontalScrollFromVerticalGesture> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // 縦方向のドラッグを検知
      onVerticalDragUpdate: (details) {
        // 縦方向の移動量を横方向のスクロールに変換
        _scrollController.position.moveTo(
          _scrollController.offset + details.delta.dy,
          // クランプを無効にして自由なスクロールを可能に
          clamp: false,
        );
      },
      child: ListView.builder(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        // スクロールの物理的な動作を無効化
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 20,
        itemBuilder: (context, index) {
          return Container(
            width: 100,
            margin: EdgeInsets.all(8),
            color: Colors.blue[100 * ((index % 9) + 1)],
            child: Center(child: Text('Item $index')),
          );
        },
      ),
    );
  }
}

