import 'package:flutter/material.dart';
import 'package:webviewer/utils/appbar_clipper.dart';

class ClippedAppbar extends StatelessWidget {
  final double height;
  const ClippedAppbar({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ClipPath(
          clipper: AppbarClipper(),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: height,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              colors: [Color(0xFF6A00FF), Color(0xFF833BFF)], // TODO
            )),
          )),
    );
  }
}
