import 'package:chewie/chewie.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/constants/app_url/app_url.dart';
import 'package:movie_app/domain/movies/entities/trailer.dart';
import 'package:movie_app/domain/movies/usecases/get_movie_trailer.dart';
import 'package:movie_app/presentation/watch/bloc/trailer_state.dart';
import 'package:movie_app/service_locator.dart';
import 'package:video_player/video_player.dart';

class TrailerCubit extends Cubit<TrailerState> {
  TrailerCubit() : super(TrailerLoading());

  void getMovieTrailer(int movieId) async {
    var returnedData = await sl<GetMovieTrailerUsecase>().call(params: movieId);
    returnedData.fold(
      (error) {
        emit(FailureLoadTrailer(errorMessage: error));
      },
      (data) async {
        TrailerEntity trailerEntity = data;

        final videoPlayerController = VideoPlayerController.networkUrl(
          Uri.parse(AppUrl.trailerBase + trailerEntity.key),
        );
        await videoPlayerController.initialize();

        final chewieController = ChewieController(
          videoPlayerController: videoPlayerController,
          autoPlay: false,
          looping: false,
        );

        emit(TrailerLoaded(chewieController: chewieController));
      },
    );
  }
}
