import 'package:flutter/material.dart';
import '../entity/names.dart' as names_entity;


class NameOfAlah extends StatelessWidget {
  const NameOfAlah({super.key, required this.title});

  final String title;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
          centerTitle: true,
        ),
        body: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            image: const DecorationImage(
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
                    List<names_entity.Names> NamesList = names_entity.parseJson(snapshot.data as String);
                    return NamesList.isNotEmpty
                        ? ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: NamesList.length,
                      itemBuilder: (BuildContext context, int index) =>
                          Card(
                            elevation: 0.7,
                            color: const Color(0xff2c2c2c),
                            child: Column(
                              textDirection: TextDirection.rtl,
                              children: <Widget>[
                                Container(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    NamesList[index].name,
                                    style: TextStyle(
                                        color: Theme.of(context).colorScheme.secondary,
                                        fontSize: 29),
                                  ),
                                ),
                                ListTile(
                                  title: Text(
                                    NamesList[index].transliteration,
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 21),
                                  ),
                                  subtitle: Text(
                                    NamesList[index].meaning,
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                  leading: CircleAvatar(
                                    backgroundColor:
                                    Theme.of(context).colorScheme.secondary,
                                    child: Text(
                                      NamesList[index].number.toString(),
                                      style: TextStyle(color: Theme.of(context).primaryColor),),
                                  ),
                                ),
                              ],
                            ),
                          ),
                    )
                        : const Center(child: CircularProgressIndicator());
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
