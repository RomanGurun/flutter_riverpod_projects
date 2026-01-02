import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appThemeProvider = Provider((ref) {
  return ThemeData(
    primarySwatch: Colors.blue,
    brightness: Brightness.light,
  );
});