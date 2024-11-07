import 'dart:ui';
import 'package:flutter/scheduler.dart';
import 'package:webviewer/constants/themes.dart';

ThemeType getSystemBrightness() {
  var brightness =
      SchedulerBinding.instance.platformDispatcher.platformBrightness;
  return brightness == Brightness.dark ? ThemeType.dark : ThemeType.light;
}
