import 'package:flutter/material.dart';


class CardName extends StatelessWidget {
  CardName({this.name, this.onTap});
  final String name;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Card(
        color: Color(0xff2c2c2c),
        elevation: 0.7,
        child: ListTile(
          onTap: onTap,
          trailing: Icon(Icons.keyboard_arrow_right, color:Theme.of(context).accentColor,),
          title: Align(alignment: Alignment.centerRight, child: Text(name, style: TextStyle(color: Colors.white),)),
        ),
      ),
    );
  }
}