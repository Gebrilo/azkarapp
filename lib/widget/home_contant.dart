import 'package:flutter/material.dart';
import '../pages/azkar_sbah.dart';
import '../pages/azkar_masaa.dart';
import '../pages/azkar_moslam.dart';
import '../pages/name_of_alah.dart';

import '../widget/card_name.dart';


class HomeContant extends StatelessWidget {
  const HomeContant({
    super.key, required this.title
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
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
                          builder: (context) => const AzkarSbah(
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
                          builder: (context) => const AzkarMasaa(
                            title: 'أذكار المساء',
                            file: 'azkar_masa',
                          )));
                },
              ),
              CardName(
                name: 'أذكار المسلم',
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const AzkarMoslam()));
                },
              ),
              CardName(
                name: 'أسماء اللّه 99',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NameOfAlah(
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
