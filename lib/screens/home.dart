import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: MaterialButton(
      onPressed: () => context.push('/iedib'),
      child: Text('Hello world'),
    )));
  }
}
