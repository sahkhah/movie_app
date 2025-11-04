import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/domain/movies/entities/trailer.dart';
import 'package:movie_app/domain/movies/usecases/get_movie_trailer.dart';
import 'package:movie_app/presentation/watch/bloc/trailer_state.dart';
import 'package:movie_app/service_locator.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TrailerCubit extends Cubit<TrailerState> {
  TrailerCubit() : super(TrailerLoading());

  void getMovieTrailer( movieId) async {
    var returnedData = await sl<GetMovieTrailerUsecase>().call(params: movieId);
    returnedData.fold(
      (error) {
        emit(FailureLoadTrailer(errorMessage: error));
      },
      (data) async {
        TrailerEntity trailerEntity = data;

        final youtubeController = YoutubePlayerController(
          initialVideoId: trailerEntity.key,
        flags: YoutubePlayerFlags(
          autoPlay: false,
          
           ));

       

        emit(TrailerLoaded(youtubePlayerController: youtubeController));
      },
    );
  }
}
