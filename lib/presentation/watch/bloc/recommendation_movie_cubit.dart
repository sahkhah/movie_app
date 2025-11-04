import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/domain/movies/usecases/get_recommendation_movies.dart';
import 'package:movie_app/presentation/watch/bloc/recommendation_movie_state.dart';
import 'package:movie_app/service_locator.dart';

class RecommendationMoviesCubit extends Cubit<RecommendationMovieState> {
  RecommendationMoviesCubit() : super(RecommendationMovieLoading());

  void getRecommendationMovies(int movieId) async {
    var result = await sl<GetRecommendationMoviesUsecase>().call(params: movieId);
    result.fold(
      (error) {
        emit(FailureLoadRecommendationMovie(errorMessage: error));
      },
      (data) {
        emit(RecommendationMovieLoaded(movies: data));
      },
    );
  }
}
