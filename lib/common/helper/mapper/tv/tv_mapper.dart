import 'package:movie_app/data/tv/models/tv_model.dart';
import 'package:movie_app/domain/tv/entities/tv_entity.dart';

class TVMapper {
  static TVEntity toEntity(TVModel tv) {
    return TVEntity(
      id: tv.id,
      title: tv.title,
      originalTitle: tv.originalTitle,
      overview: tv.overview,
      posterPath: tv.posterPath,
      mediaType: tv.mediaType,
      adults: tv.adults,
      originalLanguage: tv.originalLanguage,
      genreIds: tv.genreIds,
      popularity: tv.popularity,
      releaseDate: tv.releaseDate,
      video: tv.video,
      voteAverage: tv.voteAverage,
      voteCount: tv.voteCount,
    );
  }
}
