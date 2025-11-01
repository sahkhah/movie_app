import 'package:movie_app/data/movies/models/movie.dart';
import 'package:movie_app/domain/movies/entities/movies.dart';

class MovieMapper {
  static MovieEntity toEntity(MovieModel movie) {
    return MovieEntity(
      id: movie.id,
      title: movie.title,
      originalTitle: movie.originalTitle,
      overview: movie.overview,
      posterPath: movie.posterPath,
      mediaType: movie.mediaType,
      adults: movie.adults,
      originalLanguage: movie.originalLanguage,
      genreIds: movie.genreIds,
      popularity: movie.popularity,
      releaseDate: movie.releaseDate,
      video: movie.video,
      voteAverage: movie.voteAverage,
      voteCount: movie.voteCount,
    );
  }
}
