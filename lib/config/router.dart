import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:webviewer/bloc/box/box_cubit.dart';
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
        child: AddWebScreen(),
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
    path: '/webpage',
    pageBuilder: (context, state) {
      final uuid = state.uri.queryParameters['uuid'];
      if (uuid == null) {
        context.read<BoxCubit>().emitError('Something went wrong!');
        // The code sould end here ... // TODO
      }

      final webPage = context.read<BoxCubit>().getWebPageByUuid(uuid!);

      return CustomTransitionPage(
        key: state.pageKey,
        child: WebViewScreen(
          title: webPage.title,
          url: webPage.url,
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
        transitionDuration: const Duration(milliseconds: 300),
      );
    },
  ),
]);
