import 'dart:convert';
class Azkar {
  String category;
  String count;
  String description;
  String reference;
  String zekr;

  Azkar({
    required this.count,
    required this.zekr,
    required this.category,
    required this.description,
    required this.reference,
  });

  factory Azkar.fromJson(Map<String, dynamic> json) {
    return Azkar(
        category: json['category'] as String,
        count: json['count'] as String,
        description: json['description'] as String,
        reference: json['reference'] as String,
        zekr: json['zekr'] as String);
  }
}

List<Azkar> parseJson(String? response) {
  if (response == null) {
    return [];
  }
  final parsed =
  json.decode(response).cast<Map<String, dynamic>>();
  return parsed.map<Azkar>((json) => Azkar.fromJson(json)).toList();
}