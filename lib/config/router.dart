import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:webviewer/screens/add_web_screen.dart';
import 'package:webviewer/screens/home.dart';
import 'package:webviewer/screens/web_view_screen.dart';

final goRouter = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const Home(),
  ),
  GoRoute(
    path: '/add',
    pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: const AddWebScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 1),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 300)),
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
