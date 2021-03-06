import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widget/card_name.dart';
import '../pages/index_page.dart';



class AzkarMoslam extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("أذكار المسلم"),
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
                  name: 'أذكار الاستيقاظ من النوم',
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => IndexPage(
                                  title: 'أذكار الاستيقاظ من النوم',
                                  file: 'azkar_alnoom',
                                )));
                  },
                ),
                CardName(
                  name: 'أذكار الوضوء',
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => IndexPage(
                                  title: "أذكار الوضوء",
                                  file: 'al_wdooa',
                                )));
                  },
                ),
                CardName(
                  name: 'أذكار المسجد',
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => IndexPage(
                                  title: "أذكار المسجد",
                                  file: 'al_masjed',
                                )));
                  },
                ),
                CardName(
                  name: 'أذكار الصلاه',
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => IndexPage(
                                  title: "أذكار الصلاه",
                                  file: 'azkar_salah',
                                )));
                  },
                ),
                CardName(
                  name: 'أذكار اخرى',
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => IndexPage(
                                  title: "أذكار اخرى",
                                  file: 'azkar',
                                )));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
