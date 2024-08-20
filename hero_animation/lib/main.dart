// main.dart
import 'dart:ui';

import 'package:flutter/material.dart';

import 'screens/detail/detail_screen.dart';
import 'screens/home/home_screen.dart';

void main() {
  runApp(const MyHeroApp());
}

class MyHeroApp extends StatelessWidget {
  const MyHeroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Hero Animation',
        initialRoute: "/",
        routes: {
          '/': (context) => const HomeScreen(),
          '/detail': (context) => const DetailScreen(),
        },
        scrollBehavior: const MaterialScrollBehavior().copyWith(dragDevices: {
          PointerDeviceKind.touch,
          PointerDeviceKind.mouse,
          PointerDeviceKind.unknown,
        }));
  }
}
