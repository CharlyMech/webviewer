import 'package:flutter/material.dart';
import 'package:webviewer/config/router.dart';
import 'package:webviewer/constants/themes.dart';
import 'package:webviewer/utils/theme.dart';

class App extends StatelessWidget {
  final ThemeType appTheme;
  const App({super.key, required this.appTheme});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'WebViewer',
      routerConfig: goRouter,
      theme: themes[appTheme]!.toThemeData(),
      // debugShowCheckedModeBanner: false,
    );
  }
}
