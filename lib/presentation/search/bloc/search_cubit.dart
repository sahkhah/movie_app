import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/presentation/search/bloc/search_option_cubit.dart';
import 'package:movie_app/presentation/search/bloc/search_state.dart';
import 'package:movie_app/service_locator.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  void search(String query, SearchType searchType) {
    emit(SearchLoading());

    switch (searchType) {
      case SearchType.movies:
        searchMovies(query);
        break;
      case SearchType.tv:
        searchTV(query);
        break;
    }
  }

  void searchMovies(String query) async {
    var result = await sl<SearchMoviesUsecase>().call(params: query);
    result.fold(
      (error) {
        emit(SearchFailed(errorMessage: error));
      },
      (data) {
        emit(MovieLoaded(movies: data));
      },
    );
  }

  void searchTV(String query) async {
    var result = await sl<SearchTVUsecase>().call(params: query);
    result.fold(
      (error) {
        emit(SearchFailed(errorMessage: error));
      },
      (data) {
        emit(TVLoaded(tv: data));
      },
    );
  }
}
