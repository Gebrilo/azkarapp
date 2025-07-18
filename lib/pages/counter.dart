import 'package:flutter/material.dart';
import '../widget/drop_down.dart';


class Counter extends StatelessWidget {
  const Counter({super.key, required this.title});

  final String title;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
          centerTitle: true,
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/ground.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 20,),
              DropdownButtonMenu(),
            ],
          ),
        ),
      ),
    );
  }
}
