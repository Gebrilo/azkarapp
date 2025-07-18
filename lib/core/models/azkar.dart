import 'dart:convert';

class Azkar {
  List<Content>? content;

  Azkar({this.content});

  Azkar.fromJson(Map<String, dynamic> json) {
    if (json['content'] != null) {
      content = <Content>[];
      json['content'].forEach((v) {
        content!.add(new Content.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.content != null) {
      data['content'] = this.content!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Content {
  String? zekr;
  String? bless;
  String? count;
  String? category;

  Content({this.zekr, this.bless, this.count, this.category});

  Content.fromJson(Map<String, dynamic> json) {
    zekr = json['zekr'];
    bless = json['bless'];
    count = json['count'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['zekr'] = this.zekr;
    data['bless'] = this.bless;
    data['count'] = this.count;
    data['category'] = this.category;
    return data;
  }
}

List<Content> parseAzkarContent(String jsonString) {
  final data = json.decode(jsonString);
  if (data is Map<String, dynamic> && data.containsKey('content')) {
    return (data['content'] as List).map((item) => Content.fromJson(item)).toList();
  } else if (data is List) {
    return data.map((item) => Content.fromJson(item)).toList();
  } else {
    return [];
  }
}
