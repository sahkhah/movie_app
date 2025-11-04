import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/domain/movies/usecases/get_similar_movies.dart';
import 'package:movie_app/presentation/watch/bloc/similar_movies_state.dart';
import 'package:movie_app/service_locator.dart';

class SimilarMoviesCubit extends Cubit<SimilarMovieState> {
  SimilarMoviesCubit() : super(SimilarMovieLoading());

  void getSimilarMovies(int movieId) async {
    var result = await sl<GetSimilarMoviesUsecase>().call(
      params: movieId,
    );
    result.fold(
      (error) {
        emit(FailureLoadSimilarMovie(errorMessage: error));
      },
      (data) {
        emit(SimilarMovieLoaded(movies: data));
      },
    );
  }
}
