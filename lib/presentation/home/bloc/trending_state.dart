import 'package:movie_app/domain/movies/entities/movies.dart';

abstract class TrendingMovieState {}

class TrendingMovieLoading extends TrendingMovieState {}

class TrendingMovieLoaded extends TrendingMovieState {
  final List<MovieEntity> movies;
  TrendingMovieLoaded({required this.movies});
}

class FailureLoadTrendingMovie extends TrendingMovieState {
  final String errorMessage;

  FailureLoadTrendingMovie({required this.errorMessage});
}
