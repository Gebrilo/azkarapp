import 'package:flutter/material.dart';

class DropdownButtonMenu extends StatefulWidget {
  final Function(String) onChanged;

  const DropdownButtonMenu({super.key, required this.onChanged});

  @override
  _DropdownButtonMenuState createState() => _DropdownButtonMenuState();
}

class _DropdownButtonMenuState extends State<DropdownButtonMenu> {
  String? selectedValue;
  final List<String> list = <String>['3', '5', '7', '10', '33', '100'];

  @override
  void initState() {
    super.initState();
    selectedValue = list.first;
    // Do NOT call onChanged here. The parent already has the initial value.
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      borderRadius: BorderRadius.circular(20),
      dropdownColor: const Color(0xff2c2c2c),
      style: const TextStyle(color: Colors.white, fontSize: 19),
      value: selectedValue,
      icon: const Icon(Icons.arrow_downward, color: Color(0xffe5b620)),
      elevation: 16,
      underline: Container(
        height: 2,
        color: const Color(0xffe5b620),
      ),
      onChanged: (String? value) {
        setState(() {
          selectedValue = value!;
          widget.onChanged(selectedValue!);
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
