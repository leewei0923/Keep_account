import 'package:flutter/material.dart';

String formTime(int num) {
  return "${num > 9 ? '' : 0}$num";
}

/// 十六进制代码转成material 颜色
MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }

  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds / 0.5).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds / 0.5).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds / 0.5).round(),
      1,
    );
  }

  return MaterialColor(color.value, swatch);
}



