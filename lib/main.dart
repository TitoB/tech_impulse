import 'package:flutter/material.dart';
import 'package:tech_impulse/config/router/app_router.dart';
import 'package:tech_impulse/config/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: Apptheme(selectedColor: 1).getTheme(),
    );
  }
}

