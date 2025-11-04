import 'package:movie_app/domain/movies/entities/movies.dart';

abstract class RecommendationMovieState {}

class RecommendationMovieLoading extends RecommendationMovieState {}

class RecommendationMovieLoaded extends RecommendationMovieState {
  final List<MovieEntity> movies;
  RecommendationMovieLoaded({required this.movies});
}

class FailureLoadRecommendationMovie extends RecommendationMovieState {
  final String errorMessage;

  FailureLoadRecommendationMovie({required this.errorMessage});
}
