import 'package:flutter_bloc/flutter_bloc.dart';

enum SearchType { movies, tv }

class SearchOptionCubit extends Cubit<SearchType> {
  SearchOptionCubit() : super(SearchType.movies);

  void selectMovie() => emit(SearchType.movies);
  void selectTV() => emit(SearchType.tv);
}
