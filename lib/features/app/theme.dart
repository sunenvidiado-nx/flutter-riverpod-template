import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeDataProvider = Provider((ref) {
  return _theme;
});

ThemeData get _theme {
  return ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blue,
  );
}
