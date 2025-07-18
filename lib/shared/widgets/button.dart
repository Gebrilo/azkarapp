import 'package:flutter/material.dart';

class CounterButton extends StatefulWidget {
  const CounterButton({super.key, this.counnt});
  final String? counnt;
  @override
  _CounterButtonState createState() => _CounterButtonState();
}

class _CounterButtonState extends State<CounterButton> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      if (widget.counnt != null && _counter < int.parse(widget.counnt!)) {
        _counter++;
      } else {
        _counter = 0;
      }
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: GestureDetector(
            onTap: _incrementCounter,
            child: Container(
              margin: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: const Color(0xff2c2c2c).withAlpha(204),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  _counter.toString(),
                  style: const TextStyle(
                    fontSize: 80.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 30.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(15),
            ),
            onPressed: _resetCounter,
            child: const Icon(Icons.refresh),
          ),
        ),
      ],
    );
  }
}
