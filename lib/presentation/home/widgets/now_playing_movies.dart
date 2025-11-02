import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/widgets/movie/movie_card.dart';
import 'package:movie_app/presentation/home/bloc/now_playing_cubit.dart';
import 'package:movie_app/presentation/home/bloc/now_playing_state.dart';

class NowPlayingMovies extends StatelessWidget {
  const NowPlayingMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NowPlayingMoviesCubit>(
      create: (context) => NowPlayingMoviesCubit()..getNowPlayingMovies(),
      child: BlocBuilder<NowPlayingMoviesCubit, NowPlayingMovieState>(
        builder: (context, state) {
          if (state is NowPlayingMovieLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is NowPlayingMovieLoaded) {
            return SizedBox(
              height: 300,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, index) {
                  return MovieCard(movieEntity: state.movies[index]);
                },
                separatorBuilder: (context, _) => SizedBox(width: 10),
                itemCount: state.movies.length,
              ),
            );
          } else if (state is FailureLoadNowPlayingMovie) {
            return Text(state.errorMessage);
          }
          return Container();
        },
      ),
    );
  }
}
