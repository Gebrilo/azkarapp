import 'package:flutter/material.dart';
import '../Nav/sound.dart';
import '../widget/home_contant.dart';
import '../pages/counter.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';


class MyHomePage extends StatefulWidget {

  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 1;

  /// List of screen of navbar
  List<Widget> screens = [
    const Counter(
      title: 'السبحه',
    ),
    const HomeContant(
      title: 'أذكار المسلم',
    ),
    const Sound(
      title: 'أذكار صوتية',
    )
  ];

  /// onTap Function
  _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: IndexedStack(
          index: _selectedIndex,
          children: screens,
        ),
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          backgroundColor: Theme.of(context).colorScheme.secondary,
          buttonBackgroundColor: Theme.of(context).primaryColor,
          color: Theme.of(context).primaryColor,
          height: 70,
          items: const <Widget>[
            Icon(
              Icons.grade,
              size: 30,
              color: Colors.white,
            ),
            Icon(
              Icons.home,
              size: 30,
              color: Colors.white,
            ),
            Icon(
              Icons.volume_up,
              size: 30,
              color: Colors.white,
            ),
          ],
          animationDuration: const Duration(
            milliseconds: 200,
          ),
          animationCurve: Curves.bounceInOut,
          index: _selectedIndex,
          onTap: (index) => _onItemTapped(index),
        ),
      ),
    );
  }
}
