// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TVModel {
  final String? id;
  final String? title;
  final String? originalTitle;
  final String? overview;
  final String? posterPath;
  final String? mediaType;
  final bool? adults;
  final String? originalLanguage;
  final List<int> genreIds;
  final double? popularity;
  final DateTime? releaseDate;
  final bool? video;
  final double? voteAverage;
  final int? voteCount;

  TVModel({
    required this.id,
    required this.title,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.mediaType,
    required this.adults,
    required this.originalLanguage,
    required this.genreIds,
    required this.popularity,
    required this.releaseDate,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'originalTitle': originalTitle,
      'overview': overview,
      'posterPath': posterPath,
      'mediaType': mediaType,
      'adults': adults,
      'originalLanguage': originalLanguage,
      'genreIds': genreIds,
      'popularity': popularity,
      'releaseDate': releaseDate?.millisecondsSinceEpoch,
      'video': video,
      'voteAverage': voteAverage,
      'voteCount': voteCount,
    };
  }

  factory TVModel.fromMap(Map<String, dynamic> map) {
    return TVModel(
      id: map['id'] != null ? map['id'] as String : null,

      title: map['title'] != null ? map['title'] as String : null,

      originalTitle:
          map['originalTitle'] != null ? map['originalTitle'] as String : null,

      overview: map['overview'] != null ? map['overview'] as String : null,

      posterPath:
          map['posterPath'] != null ? map['posterPath'] as String : null,

      mediaType: map['mediaType'] != null ? map['mediaType'] as String : null,

      adults: map['adults'] != null ? map['adults'] as bool : null,

      originalLanguage:
          map['originalLanguage'] != null
              ? map['originalLanguage'] as String
              : null,

      genreIds: List<int>.from((map['genreIds'] as List<int>)),

      popularity:
          map['popularity'] != null ? map['popularity'] as double : null,

      releaseDate:
          map['releaseDate'] != null
              ? DateTime.tryParse(map['releaseDate'])
              : null,

      video: map['video'] != null ? map['video'] as bool : null,

      voteAverage:
          map['voteAverage'] != null ? map['voteAverage'] as double : null,

      voteCount: map['voteCount'] != null ? map['voteCount'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TVModel.fromJson(String source) =>
      TVModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
