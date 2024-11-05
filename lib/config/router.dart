import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iedib_wv/screens/home.dart';
import 'package:iedib_wv/screens/web_view_screen.dart';

final goRouter = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const Home(),
  ),
  GoRoute(
    path: '/iedib',
    pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const WebViewScreen(
          title: 'IEDIB',
          url: 'https://flutter.dev/',
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 300)),
  ),
]);
