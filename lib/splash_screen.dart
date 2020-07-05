import 'dart:async';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 5),
        () => Navigator.pushReplacementNamed(context, 'home'));
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/logo.jpg"),
                  fit: BoxFit.cover),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "بِسْم اللَّـهِ الرَّحْمَـٰنِ الرَّحِيمِ",
                      style: TextStyle(fontSize: 28, color: Colors.white),
                    ),
                    CircularProgressIndicator(),
                    Padding(
                      padding: EdgeInsets.only(top: 15.0),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
