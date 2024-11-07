import 'package:flutter/material.dart';
import 'package:webviewer/constants/themes.dart';

extension MyThemeToThemeData on MyTheme {
  ThemeData toThemeData() {
    return ThemeData(
      primaryColor: Color(int.parse(primaryColor.replaceFirst('#', '0xff'))),
      scaffoldBackgroundColor:
          Color(int.parse(surface.replaceFirst('#', '0xff'))),
      textTheme: TextTheme(
        bodyLarge:
            TextStyle(color: Color(int.parse(text.replaceFirst('#', '0xff')))),
        bodyMedium:
            TextStyle(color: Color(int.parse(text.replaceFirst('#', '0xff')))),
      ),

      // TODO -> fine tune this
      colorScheme: ColorScheme(
        primary: Color(int.parse(primaryColor.replaceFirst('#', '0xff'))),
        secondary: Color(int.parse(primaryColor.replaceFirst(
            '#', '0xff'))), // I don't need a secondary for now
        surface: Color(int.parse(surface.replaceFirst('#', '0xff'))),
        error: const Color(0xFFDC143C), // Manually set
        onPrimary: Color(int.parse(white.replaceFirst('#', '0xff'))),
        onSecondary: Color(int.parse(black.replaceFirst('#', '0xff'))),
        onSurface: Color(int.parse(text.replaceFirst('#', '0xff'))),
        onError: Color(int.parse(white.replaceFirst('#', '0xff'))),
        brightness: this == themes[ThemeType.light]
            ? Brightness.light
            : Brightness.dark,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor:
            Color(int.parse(primaryColor.replaceFirst('#', '0xff'))),
        iconSize: 40,
        foregroundColor: Color(int.parse(white.replaceFirst('#', '0xff'))),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
        backgroundColor:
            WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
          return Color(int.parse(primaryColor.replaceFirst('#', '0xff')));
        }),
        foregroundColor:
            WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
          return Color(int.parse(white.replaceFirst('#', '0xff')));
        }),
      )),
    );
  }
}
