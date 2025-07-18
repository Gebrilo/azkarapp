import 'package:flutter/material.dart';
import 'package:azkarapp/features/azkar/pages/azkar_page.dart';

class IndexPage extends StatelessWidget {
  final String title;
  final String file;

  const IndexPage({super.key, required this.title, required this.file});

  @override
  Widget build(BuildContext context) {
    return AzkarPage(title: title, jsonFile: file);
  }
}
