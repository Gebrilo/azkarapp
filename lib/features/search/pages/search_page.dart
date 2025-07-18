import 'package:azkarapp/core/models/search_item.dart';
import 'package:azkarapp/features/azkar/pages/azkar_page.dart';
import 'package:azkarapp/core/services/search_service.dart';
import 'package:flutter/material.dart';
import 'package:azkarapp/features/names_of_allah/pages/name_of_alah.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _searchService = SearchService();
  List<SearchItem> _results = [];
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchService.init();
  }

  void _onSearchChanged(String query) {
    setState(() {
      _results = _searchService.search(query);
    });
  }

  void _navigateToResult(SearchItem item) {
    Widget? page;
    if (item.sourceFile == 'name_of_alah') {
      page = NameOfAlah(
        highlightedIndex: item.originalIndex,
      );
    } else {
      bool showCounter = item.sourceFile == 'azkar_sbah' || item.sourceFile == 'azkar_masa';
      page = AzkarPage(
        title: item.pageTitle,
        jsonFile: item.sourceFile,
        highlightedIndex: item.originalIndex,
        showCounter: showCounter,
      );
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page!),
    );
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          autofocus: true,
          onChanged: _onSearchChanged,
          decoration: InputDecoration(
            hintText: 'Search...',
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.white.withAlpha(179)),
          ),
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          image: const DecorationImage(
            image: AssetImage("assets/images/d_ground.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView.builder(
          itemCount: _results.length,
          itemBuilder: (context, index) {
            final item = _results[index];
            return Card(
              color: const Color(0xff2c2c2c).withAlpha(204),
              child: ListTile(
                title: Text(item.title, style: const TextStyle(color: Colors.white)),
                subtitle: Text(item.content, style: TextStyle(color: Colors.white.withAlpha(179))),
                onTap: () => _navigateToResult(item),
              ),
            );
          },
        ),
      ),
    );
  }
}
