import 'package:flutter/material.dart';
import 'package:webviewer/app.dart';
import 'package:webviewer/config/hive.dart';
import 'package:webviewer/config/system.dart';
import 'package:webviewer/config/theme.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Ensure all widgets are initialized before launching the app
  configureSystemUI();
  await initHiveStorage();

  // TODO -> load preferred theme (pass it as parameter to App)
  runApp(App(
    appTheme: getSystemBrightness(),
  ));
}
