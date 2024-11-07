import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webviewer/app.dart';

void main() {
  // Ensure all widgets are initialized before launching the app
  WidgetsFlutterBinding.ensureInitialized();
  // Set the system UI overlay style at app startup
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarDividerColor: Colors.transparent,
    ),
  );
  // Enable edge-to-edge
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.edgeToEdge,
    overlays: [SystemUiOverlay.top],
  );

  // TODO -> load preferred theme (pass it as parameter to App)
  runApp(App());
}
