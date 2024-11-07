import 'package:flutter/material.dart';
import 'package:webviewer/config/router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'WebViewer',
      routerConfig: goRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}
