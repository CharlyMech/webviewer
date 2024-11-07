import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddWebScreen extends StatelessWidget {
  const AddWebScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => context.pop(), icon: const Icon(Icons.arrow_back)),
      ),
    );
  }
}
