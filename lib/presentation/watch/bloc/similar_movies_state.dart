import 'package:movie_app/domain/movies/entities/movies.dart';

abstract class SimilarMovieState {}

class SimilarMovieLoading extends SimilarMovieState {}

class SimilarMovieLoaded extends SimilarMovieState {
  final List<MovieEntity> movies;
  SimilarMovieLoaded({required this.movies});
}

class FailureLoadSimilarMovie extends SimilarMovieState {
  final String errorMessage;

  FailureLoadSimilarMovie({required this.errorMessage});
}
