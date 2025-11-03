// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TrailerModel {
  final String iso6391;
  final String iso31661;
  final String name;
  final String key;
  final String site;
  final int size;
  final String type;
  final bool official;
  final DateTime publishedAt;
  final String id;

  TrailerModel({
    required this.iso6391,
    required this.iso31661,
    required this.name,
    required this.key,
    required this.site,
    required this.size,
    required this.type,
    required this.official,
    required this.publishedAt,
    required this.id,
  });

    factory TrailerModel.fromMap(Map<String, dynamic> map) {
    return TrailerModel(
      iso6391: map['iso6391'] as String,
      iso31661: map['iso31661'] as String,
      name: map['name'] as String,
      key: map['key'] as String,
      site: map['site'] as String,
      size: map['size'] as int,
      type: map['type'] as String,
      official: map['official'] as bool,
      publishedAt: DateTime.tryParse( map['publishedAt'] ?? "") as DateTime,
      id: map['id'] as String,
    );
  }

 
  factory TrailerModel.fromJson(String source) => TrailerModel.fromMap(json.decode(source) as Map<String, dynamic>);

 
}
