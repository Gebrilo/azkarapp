import 'dart:convert';
import 'package:flutter/material.dart';
import '../entity/azkar.dart';


class AzkarSbah extends StatelessWidget {
  AzkarSbah({Key key, this.title , this.file}) : super(key: key);

  final String title;
  final String file;
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            image: DecorationImage(
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
                    List<Azkar> azkarList = parseJson(snapshot.data.toString());
                    return azkarList.isNotEmpty
                        ? ListView.builder(
                      itemCount: azkarList.length,
                      itemBuilder: (BuildContext context, int index) => Card(
                        elevation: 0.7,
                        color: Color(0xff2c2c2c),
                        child: ListTile(
                          title: Text(azkarList[index].zekr, style: TextStyle(color: Colors.white ,fontSize: 19),),
                          subtitle: Text(azkarList[index].description, style: TextStyle(color: Color(0xffe5b620)),),
                          leading: Text(azkarList[index].count, style: TextStyle(color: Color(0xffe5b620)),),
                        ),
                      ),
                    )
                        :  Center(child: CircularProgressIndicator());
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                }),

          ),
        ),
      ),
    );
  }
  List<Azkar> parseJson(String response) {
    if (response == null) {
      return [];
    }
    final parsed =
    json.decode(response.toString()).cast<Map<String, dynamic>>();
    return parsed.map<Azkar>((json) => Azkar.fromJson(json)).toList();
  }
}
