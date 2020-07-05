import 'package:flutter/material.dart';
import '../pages/azkar_sbah.dart';
import '../pages/azkar_masaa.dart';
import '../pages/azkar_moslam.dart';
import '../pages/name_of_alah.dart';
import '../pages/counter.dart';

import '../widget/card_name.dart';


class HomeContant extends StatelessWidget {
  const HomeContant({
    Key key, this.title
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(alignment: Alignment.center, child: Text(title)),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          image: DecorationImage(
            image: AssetImage("assets/images/back_ground.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            children: <Widget>[
              CardName(
                name: 'أذكار الصباح',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AzkarSbah(
                            title: 'أذكار الصباح',
                            file: 'azkar_sbah',
                          )));
                },
              ),
              CardName(
                name: 'أذكار المساء',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AzkarMasaa(
                            title: 'أذكار المساء',
                            file: 'azkar_masa',
                          )));
                },
              ),
              CardName(
                name: 'أذكار المسلم',
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AzkarMoslam()));
                },
              ),
              CardName(
                name: 'أسماء اللّه 99',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NameOfAlah(
                            title: "أسماء اللّه 99",
                          )));
                },
              ),

            ],
          ),
        ),
      ),
    );
  }
}
