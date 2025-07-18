import './splash_screen.dart';
import 'package:flutter/material.dart';
import './pages/home_page.dart';

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
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey).copyWith(
          secondary: const Color(0xffe5b620),
          primary: const Color(0xff2c2c2c),
        ),
        // To make the surface color available throughout the app if needed
        scaffoldBackgroundColor: const Color(0xffe5b620), 
      ),
      home: const SplashScreen(),
    );
  }
}
