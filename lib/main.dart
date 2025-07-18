import 'package:azkarapp/features/home/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:azkarapp/features/home/pages/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        'home': (context) => const MyHomePage(title: 'أذكار المسلم'),
      },
      title: 'أذكار المسلم',
      theme: ThemeData(
        // Using ColorScheme.fromSeed is the modern and recommended way to
        // create a color scheme that is consistent and visually appealing.
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xff2c2c2c),
          secondary: const Color(0xffe5b620),
          primary: const Color(0xff2c2c2c),
          background: const Color(0xffe5b620)
        ),
        scaffoldBackgroundColor: const Color(0xffe5b620),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xff2c2c2c),
          foregroundColor: Colors.white,
          centerTitle: true, // Center title globally
        ),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
