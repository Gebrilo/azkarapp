import './splash_screen.dart';
import 'package:flutter/material.dart';
import './pages/home_page.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        'home': (context) => MyHomePage(title: 'أذكار المسلم'),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        backgroundColor: Color(0xffe5b620),
        accentColor: Color(0xffe5b620),
        primaryColor: Color(0xff2c2c2c),
      ),
      home: SplashScreen(),
    );
  }
}


