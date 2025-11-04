import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/presentation/watch/bloc/trailer_cubit.dart';
import 'package:movie_app/presentation/watch/bloc/trailer_state.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayer extends StatelessWidget {
  final int id;
  const VideoPlayer({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TrailerCubit>(
      create: (context) => TrailerCubit()..getMovieTrailer(id),
      child: BlocBuilder<TrailerCubit, TrailerState>(
        builder: (context, state) {
          if (state is TrailerLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is TrailerLoaded) {
            return YoutubePlayer(
              controller: state.youtubePlayerController,
            showVideoProgressIndicator: true,
            );
          } else if (state is FailureLoadTrailer) {
            return Text(state.errorMessage);
          }
          return Container();
        },
      ),
    );
  }
}
