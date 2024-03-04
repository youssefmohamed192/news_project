import 'package:flutter/material.dart';
import 'package:news_project/ui/screens/home/home_screen.dart';
import 'package:news_project/ui/screens/splash/splash_screen.dart';
import 'package:news_project/ui/utils/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      routes: {
        SplashScreen.routeName : (_) => const SplashScreen(),
        HomeScreen.routeName : (_) => const HomeScreen(),
      },
      initialRoute: HomeScreen.routeName,
    );
  }
}