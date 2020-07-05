import 'package:flutter/material.dart';
import '../entity/names.dart';


class NameOfAlah extends StatelessWidget {
  NameOfAlah({Key key, this.title}) : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            image: DecorationImage(
              image: AssetImage("assets/images/a_ground.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: FutureBuilder(
                future: DefaultAssetBundle.of(context)
                    .loadString('assets/json/name_of_alah.json'),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Names> NamesList = parseJson(snapshot.data.toString());
                    return NamesList.isNotEmpty
                        ? ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: NamesList.length,
                      itemBuilder: (BuildContext context, int index) =>
                          Card(
                            elevation: 0.7,
                            color: Color(0xff2c2c2c),
                            child: Column(
                              textDirection: TextDirection.rtl,
                              children: <Widget>[
                                Container(
                                  child: Text(
                                    NamesList[index].name,
                                    style: TextStyle(
                                        color: Theme.of(context).accentColor,
                                        fontSize: 29),
                                  ),
                                ),
                                ListTile(
                                  title: Text(
                                    NamesList[index].transliteration,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 21),
                                  ),
                                  subtitle: Text(
                                    NamesList[index].meaning,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                  leading: CircleAvatar(
                                    backgroundColor:
                                    Theme.of(context).accentColor,
                                    child: Text(
                                      NamesList[index].number.toString(),
                                      style: TextStyle(color: Theme.of(context).primaryColor),),
                                  ),
                                ),
                              ],
                            ),
                          ),
                    )
                        : Center(child: CircularProgressIndicator());
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                }),
          ),
        ),
      ),
    );
  }
}

