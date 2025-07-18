import 'package:flutter/material.dart';
import 'package:azkarapp/shared/widgets/button.dart';
import 'package:azkarapp/shared/widgets/drop_down.dart';

class Counter extends StatefulWidget {
  const Counter({super.key, required this.title});
  final String title;
  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  String _selectedValue = '3';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/ground.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: <Widget>[
          const SizedBox(height: 20),
          DropdownButtonMenu(
            onChanged: (String newValue) {
              setState(() {
                _selectedValue = newValue;
              });
            },
          ),
          Expanded(
            child: CounterButton(
              counnt: _selectedValue,
            ),
          ),
        ],
      ),
    );
  }
}
