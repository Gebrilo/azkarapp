import 'package:flutter/material.dart';
import '../entity/azkar.dart' as azkar_entity;


class AzkarSbah extends StatelessWidget {
  const AzkarSbah({super.key, required this.title , required this.file});

  final String title;
  final String file;
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
          centerTitle: true,
        ),
        body: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            image: const DecorationImage(
              image: AssetImage("assets/images/d_ground.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: FutureBuilder(
                future: DefaultAssetBundle.of(context)
                    .loadString('assets/json/$file.json'),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<azkar_entity.Azkar> azkarList = azkar_entity.parseJson(snapshot.data as String);
                    return azkarList.isNotEmpty
                        ? ListView.builder(
                      itemCount: azkarList.length,
                      itemBuilder: (BuildContext context, int index) => Card(
                        elevation: 0.7,
                        color: const Color(0xff2c2c2c),
                        child: ListTile(
                          title: Text(azkarList[index].zekr, style: const TextStyle(color: Colors.white ,fontSize: 19),),
                          subtitle: Text(azkarList[index].description, style: const TextStyle(color: Color(0xffe5b620)),),
                          leading: Text(azkarList[index].count, style: const TextStyle(color: Color(0xffe5b620)),),
                        ),
                      ),
                    )
                        :  const Center(child: CircularProgressIndicator());
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }),

          ),
        ),
      ),
    );
  }
}
