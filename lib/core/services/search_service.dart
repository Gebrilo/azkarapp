import 'package:flutter/services.dart';
import 'package:azkarapp/core/models/search_item.dart';
import 'package:azkarapp/core/models/azkar.dart' as azkar_entity;
import 'package:azkarapp/core/models/names.dart' as names_entity;

class SearchService {
  static final SearchService _instance = SearchService._internal();
  factory SearchService() => _instance;
  SearchService._internal();

  List<SearchItem> _allSearchableItems = [];
  bool _isInitialized = false;

  Future<void> init() async {
    if (_isInitialized) return;

    final List<Map<String, dynamic>> jsonConfigs = [
      {'file': 'azkar_sbah', 'title': 'أذكار الصباح'},
      {'file': 'azkar_masa', 'title': 'أذكار المساء'},
      {'file': 'azkar_alnoom', 'title': 'أذكار النوم'},
      {'file': 'azkar_salah', 'title': 'أذكار الصلاة'},
      {'file': 'al_masjed', 'title': 'أذكار المسجد'},
      {'file': 'al_wdooa', 'title': 'أذكار الوضوء'},
      {'file': 'azkar', 'title': 'أذكار'},
      {'file': 'name_of_alah', 'title': 'أسماء الله الحسنى'},
    ];

    for (var config in jsonConfigs) {
      final jsonString = await rootBundle.loadString('assets/json/${config['file']}.json');
      
      if (config['file'] == 'name_of_alah') {
        final namesList = names_entity.parseNames(jsonString);
        for (int i = 0; i < namesList.length; i++) {
          final item = namesList[i];
          _allSearchableItems.add(SearchItem(
            title: item.name ?? '',
            content: item.meaning ?? '',
            sourceFile: config['file'],
            pageTitle: config['title'],
            originalIndex: i,
          ));
        }
      } else {
        final azkarList = azkar_entity.parseAzkarContent(jsonString);
        for (int i = 0; i < azkarList.length; i++) {
          final item = azkarList[i];
          _allSearchableItems.add(SearchItem(
            title: item.zekr ?? '',
            content: item.bless ?? '',
            sourceFile: config['file'],
            pageTitle: config['title'],
            originalIndex: i,
            category: item.category,
          ));
        }
      }
    }
    _isInitialized = true;
  }

  List<SearchItem> search(String query) {
    if (query.isEmpty) return [];
    return _allSearchableItems.where((item) => item.matches(query)).toList();
  }
}
