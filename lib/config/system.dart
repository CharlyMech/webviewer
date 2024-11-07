import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void configureSystemUI() {
  // Set the system UI overlay style
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
}
