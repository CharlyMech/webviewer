import 'package:flutter/material.dart';
import 'package:webviewer/app.dart';
import 'package:webviewer/config/system.dart';
import 'package:webviewer/config/theme.dart';
import 'package:webviewer/constants/themes.dart';

void main() {
  WidgetsFlutterBinding
      .ensureInitialized(); // Ensure all widgets are initialized before launching the app
  configureSystemUI();
  ThemeType appTheme = getSystemBrightness();

  // TODO -> load preferred theme (pass it as parameter to App)
  runApp(App(
    appTheme: appTheme,
  ));
}
