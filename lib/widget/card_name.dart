import 'package:flutter/material.dart';


class CardName extends StatelessWidget {
  const CardName({super.key, required this.name, required this.onTap});
  final String name;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Card(
        color: const Color(0xff2c2c2c),
        elevation: 0.7,
        child: ListTile(
          onTap: onTap,
          trailing: Icon(Icons.keyboard_arrow_right, color:Theme.of(context).colorScheme.secondary,),
          title: Align(alignment: Alignment.centerRight, child: Text(name, style: const TextStyle(color: Colors.white),)),
        ),
      ),
    );
  }
}