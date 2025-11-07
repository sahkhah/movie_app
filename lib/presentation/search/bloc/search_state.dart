// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:movie_app/domain/movies/entities/movies.dart';
import 'package:movie_app/domain/tv/entities/tv_entity.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class MovieLoaded extends SearchState {
  final List<MovieEntity> movies;
  MovieLoaded({required this.movies});
}

class TVLoaded extends SearchState {
  final List<TVEntity> tv;
  TVLoaded({required this.tv});
}

class SearchFailed extends SearchState {
  final String errorMessage;
  SearchFailed({
    required this.errorMessage,
  });
}
