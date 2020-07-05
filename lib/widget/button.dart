import 'package:flutter/material.dart';



class CounterButton extends StatefulWidget {
  CounterButton({this.counnt});
  String counnt;
  @override
  _CounterButtonState createState() => _CounterButtonState();
}

class _CounterButtonState extends State<CounterButton> {
  int _counter = 0;


  void _incrementCounter() {
    setState(() {
      if(_counter < int.parse(widget.counnt))
      {_counter++;}else{
        _counter = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 105,
      child: Stack(
        children: <Widget>[
          Center(
              child: Container(
                  width: MediaQuery.of(context).size.width * 0.25,
                  height: MediaQuery.of(context).size.height,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [Color(0xffe5b620), Color(0xff2c2c2c)])),
                  ))),
          Center(
              child: Container(
                  width: MediaQuery.of(context).size.width * 0.175,
                  height: MediaQuery.of(context).size.height,
                  child: new RaisedButton(
                      elevation: 0.0,
                      color: Colors.white,
                      child: new Text(
                        _counter.toString(),
                        style: TextStyle(
                            fontSize: 25.0, fontWeight: FontWeight.bold),
                      ),
                      onPressed: () => _incrementCounter(),
                      shape: CircleBorder())))
        ],
      ),
    );
  }
}
