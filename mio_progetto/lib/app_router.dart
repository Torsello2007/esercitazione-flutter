import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'main_layout.dart';
import 'main.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/input',
  routes: [
    ShellRoute(
      builder: (context, state, child) => MainLayout(child: child),
      routes: [
        GoRoute(
          path: '/input',
          builder: (context, state) => const InputPage(),
        ),
        GoRoute(
          path: '/list',
          builder: (context, state) => const ListPage(),
        ),
      ],
    ),
  ],
);
