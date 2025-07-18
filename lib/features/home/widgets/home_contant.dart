import 'package:flutter/material.dart';
import 'package:azkarapp/features/azkar/pages/azkar_page.dart';
import 'package:azkarapp/features/names_of_allah/pages/name_of_alah.dart';
import 'package:azkarapp/shared/widgets/custom_card.dart';

class HomeContant extends StatelessWidget {
  const HomeContant({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/back_ground.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: GridView.count(
          crossAxisCount: 2,
          padding: const EdgeInsets.all(10.0),
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
          children: <Widget>[
            CustomCard(
              name: 'أذكار الصباح',
              icon: Icons.sunny,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AzkarPage(
                              title: 'أذكار الصباح',
                              jsonFile: 'azkar_sbah',
                              showCounter: true,
                            )));
              },
            ),
            CustomCard(
              name: 'أذكار المساء',
              icon: Icons.nightlight_round,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AzkarPage(
                              title: 'أذكار المساء',
                              jsonFile: 'azkar_masa',
                              showCounter: true,
                            )));
              },
            ),
            CustomCard(
              name: 'أذكار النوم',
              icon: Icons.bedtime,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AzkarPage(
                              title: 'أذكار النوم',
                              jsonFile: 'azkar_alnoom',
                            )));
              },
            ),
            CustomCard(
              name: 'أذكار الصلاة',
              icon: Icons.mosque,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AzkarPage(
                              title: 'أذكار الصلاة',
                              jsonFile: 'azkar_salah',
                            )));
              },
            ),
            CustomCard(
              name: 'أذكار المسجد',
              icon: Icons.mosque_outlined,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AzkarPage(
                              title: 'أذكار المسجد',
                              jsonFile: 'al_masjed',
                            )));
              },
            ),
            CustomCard(
              name: 'أذكار الوضوء',
              icon: Icons.water_drop,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AzkarPage(
                              title: 'أذكار الوضوء',
                              jsonFile: 'al_wdooa',
                            )));
              },
            ),
            CustomCard(
              name: 'أذكار المسلم',
              icon: Icons.person,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AzkarPage(
                              title: 'أذكار المسلم',
                              jsonFile: 'azkar',
                            )));
              },
            ),
            CustomCard(
              name: 'أسماء اللّه 99',
              icon: Icons.format_list_numbered,
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const NameOfAlah()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
