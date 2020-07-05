import 'package:flutter/material.dart';
import '../widget/drop_down.dart';


class Counter extends StatelessWidget {
  Counter({Key key, this.title}) : super(key: key);

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
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            image: DecorationImage(
              image: AssetImage("assets/images/ground.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
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

