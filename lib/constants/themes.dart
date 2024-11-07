enum ThemeType { light, dark }

const String primaryColor = '#6A00FF';
const String black = '#202020';
const String white = '#FAFAFA';
const String shadow = '#555555';

class MyTheme {
  final String surface; // Former backgroundColor
  final String primaryColor;
  final String text;
  final String black;
  final String white;
  final String shadow;

  MyTheme({
    required this.surface,
    required this.primaryColor,
    required this.text,
    required this.black,
    required this.white,
    required this.shadow,
  });
}

final Map<ThemeType, MyTheme> themes = {
  ThemeType.light: MyTheme(
    surface: '#F0F0F0',
    primaryColor: primaryColor,
    text: black,
    black: black,
    white: white,
    shadow: shadow,
  ),
  ThemeType.dark: MyTheme(
    surface: '#17203A',
    primaryColor: primaryColor,
    text: white,
    black: black,
    white: white,
    shadow: shadow,
  ),
};
