import 'dart:convert';

class Names {
  List<Name>? names;

  Names({this.names});

  Names.fromJson(Map<String, dynamic> json) {
    if (json['names'] != null) {
      names = <Name>[];
      json['names'].forEach((v) {
        names!.add(new Name.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.names != null) {
      data['names'] = this.names!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Name {
  String? name;
  String? transliteration;
  int? number;
  String? meaning;

  Name({this.name, this.transliteration, this.number, this.meaning});

  Name.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    transliteration = json['transliteration'];
    number = json['number'];
    meaning = json['meaning'];
  }

  get text => null;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['transliteration'] = this.transliteration;
    data['number'] = this.number;
    data['meaning'] = this.meaning;
    return data;
  }
}

List<Name> parseNames(String jsonString) {
  final data = json.decode(jsonString);
  if (data is Map<String, dynamic> && data.containsKey('names')) {
    return (data['names'] as List).map((item) => Name.fromJson(item)).toList();
  } else if (data is List) {
    return data.map((item) => Name.fromJson(item)).toList();
  } else {
    return [];
  }
}
