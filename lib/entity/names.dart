import 'dart:convert';

class Names{
  String name;
  String transliteration;
  int number;
  String meaning;

  Names({this.name,this.transliteration, this.number ,this.meaning});


  factory Names.fromJson(Map<String, dynamic> json) {
    return Names(
        name: json['name'] as String,
        transliteration:  json['transliteration'] as String,
        number: json['number'] as int,
        meaning: json['meaning'] as String,
        );
  }
}
List<Names> parseJson(String response) {
  if (response == null) {
    return [];
  }
  final parsed =
  json.decode(response.toString()).cast<Map<String, dynamic>>();
  return parsed.map<Names>((json) => Names.fromJson(json)).toList();
}