import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/domain/movies/usecases/search_movie.dart';
import 'package:movie_app/domain/movies/usecases/search_tv.dart';
import 'package:movie_app/presentation/search/bloc/search_option_cubit.dart';
import 'package:movie_app/presentation/search/bloc/search_state.dart';
import 'package:movie_app/service_locator.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  final controller = TextEditingController();

  void search(String query, SearchType searchType) {
    emit(SearchLoading());
    if(query.isNotEmpty){
       switch (searchType) {
        case SearchType.movies:
          searchMovies(query);
          break;
        case SearchType.tv:
          searchTV(query);
          break;
      }
    }
  }

  void searchMovies(String query) async {
    var result = await sl<SearchMovieUsecase>().call(params: query);
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
    var result = await sl<SearchTvUsecase>().call(params: query);
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
