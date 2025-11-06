import 'package:flutter_bloc/flutter_bloc.dart';

enum SearchType { movies, tV }

class SearchOptionCubit extends Cubit<SearchType> {
  SearchOptionCubit() : super(SearchType.movies);

  void onClicked() {
    switch (SearchType) {
      case SearchType.movies:
        emit(SearchType.movies);
      case SearchType.tV:
        emit(SearchType.tV);
    }
  }
}
