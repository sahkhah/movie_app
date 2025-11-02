import 'package:movie_app/domain/movies/entities/movies.dart';

abstract class NowPlayingMovieState {}

class NowPlayingMovieLoading extends NowPlayingMovieState {}

class NowPlayingMovieLoaded extends NowPlayingMovieState {
  final List<MovieEntity> movies;
  NowPlayingMovieLoaded({required this.movies});
}

class FailureLoadNowPlayingMovie extends NowPlayingMovieState {
  final String errorMessage;

  FailureLoadNowPlayingMovie({required this.errorMessage});
}
