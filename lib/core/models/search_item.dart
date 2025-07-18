class SearchItem {
  final String title;
  final String content;
  final String sourceFile;
  final String pageTitle;
  final int originalIndex;
  final String? category;

  SearchItem({
    required this.title,
    required this.content,
    required this.sourceFile,
    required this.pageTitle,
    required this.originalIndex,
    this.category,
  });

  bool matches(String query) {
    final lowerCaseQuery = query.toLowerCase();
    return title.toLowerCase().contains(lowerCaseQuery) ||
           content.toLowerCase().contains(lowerCaseQuery) ||
           (category != null && category!.toLowerCase().contains(lowerCaseQuery));
  }
}
