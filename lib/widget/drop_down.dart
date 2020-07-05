import 'package:flutter/material.dart';
import './button.dart';

class DropdownButtonMenu extends StatefulWidget {
  const DropdownButtonMenu({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DropdownButtonMenuState();
}

class _DropdownButtonMenuState extends State<DropdownButtonMenu> {
  static const menuItems = <String>[
    'سُبْحَانَ اللَّه',
    'الْحَمْدُ لِلَّهِ',
    'اللَّهُ أَكْبَرُ',
    'سُبْحـانَ اللهِ وَبِحَمْـدِهِ',
    'اللَّهُمَّ صَلِّ وَسَلِّمْ وَبَارِكْ على نَبِيِّنَا مُحمَّد',
  ];

  static const menuItemsCounter = <String>[
    '33',
    '100',
    '200',
    '300',
  ];

  final List<DropdownMenuItem<String>> _dropDownMenuCounter = menuItemsCounter.map((String value) => DropdownMenuItem<String>(
    value: value,
    child: Text(value),
  )).toList();

  final List<DropdownMenuItem<String>> _dropDownMenuItems = menuItems
      .map(
        (String value) => DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        ),
      )
      .toList();


  String _btn1SelectedVal = 'سُبْحَانَ اللَّه';
  String _btn2SelectedVal = '33';

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  border: Border.all(color: Theme.of(context).accentColor),
                  borderRadius: BorderRadius.all(Radius.circular(10.5))
              ),
              child: Text(_btn1SelectedVal, style: TextStyle(color: Colors.white, fontSize: 35),),
            ),
          ),
          SizedBox(
            height: 10,
          ),
            ListTile(
              title: Text('أختار :', style: TextStyle(color: Theme.of(context).accentColor, fontSize: 20, fontWeight: FontWeight.bold),),
              trailing: DropdownButton<String>(
                // Must be one of items.value.
                style: TextStyle(color: Theme.of(context).accentColor, fontSize: 18, fontWeight: FontWeight.bold),
                value: _btn1SelectedVal,
                onChanged: (String newValue) {
                  setState(() {
                    _btn1SelectedVal = newValue;
                  });
                },
                items: this._dropDownMenuItems,
              ),
            ),
          SizedBox(height: 15,),
          ListTile(
            title: Text('مرات التكرار :', style: TextStyle(color: Theme.of(context).accentColor, fontSize: 20, fontWeight: FontWeight.bold),),
            trailing: DropdownButton<String>(
              // Must be one of items.value.
              style: TextStyle(color: Theme.of(context).accentColor, fontSize: 18, fontWeight: FontWeight.bold),
              value: _btn2SelectedVal,
              onChanged: (String newValue) {
                setState(() {
                  _btn2SelectedVal = newValue;
                });
              },
              items: this._dropDownMenuCounter,
            ),
          ),
          SizedBox(height: 145,),
          CounterButton(counnt: _btn2SelectedVal,),
        ],
      ),
    );
  }
}
