import 'package:currency/pages/emoji_page.dart';
import 'package:currency/pages/home_page.dart';
import 'package:currency/pages/new_emoji_page.dart';
import 'package:currency/pages/new_event_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:currency/pages/record_page.dart';

final RouteObserver<ModalRoute<void>> routeObserver =
    RouteObserver<ModalRoute<void>>();

class AppRoutes {
  static final GoRouter router = GoRouter(
    observers: [routeObserver],
    initialLocation: '/',
    routes: [
      // GoRoute(path: '/', builder: (context, state) => const TabPage()),
      GoRoute(path: '/', builder: (context, state) => const HomePage()),
      GoRoute(
        path: '/newEvent',
        builder: (context, state) => const NewEventPage(),
      ),
      GoRoute(path: '/record', builder: (context, state) => const RecordPage()),
      GoRoute(
        path: '/emoji',
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>;
          return EmojiPage(id: extra['id']);
        },
      ),
      GoRoute(path: '/newEmoji', builder: (context, state) => const NewEmojiPage()),
    ],
  );
}
