import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/domain/movies/usecases/get_trending_movies.dart';
import 'package:movie_app/presentation/home/bloc/now_playing_state.dart';
import 'package:movie_app/service_locator.dart';

class NowPlayingMoviesCubit extends Cubit<NowPlayingMovieState> {
  NowPlayingMoviesCubit() : super(NowPlayingMovieLoading());

  void getNowPlayingMovies() async {
    var result = await sl<GetTrendingMoviesUsecase>().call();
    result.fold(
      (error) {
        emit(FailureLoadNowPlayingMovie(errorMessage: error));
      },
      (data) {
        emit(NowPlayingMovieLoaded(movies: data));
      },
    );
  }
}
