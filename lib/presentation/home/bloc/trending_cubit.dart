import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/domain/movies/usecases/movies.dart';
import 'package:movie_app/presentation/home/bloc/trending_state.dart';
import 'package:movie_app/service_locator.dart';

class TrendingMovieCubit extends Cubit<TrendingMovieState> {
  TrendingMovieCubit() : super(TrendingMovieLoading());

  void getTrendingMovies() async {
    var result = await sl<GetTrendingMoviesUsecase>().call();
    result.fold(
      (error) {
        emit(FailureLoadTrendingMovie(errorMessage: error));
      },
      (data) {
        emit(TrendingMovieLoaded(movies: data));
      },
    );
  }
}
