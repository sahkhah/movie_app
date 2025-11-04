import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:movie_app/common/widgets/movie/movie_card.dart';
import 'package:movie_app/presentation/watch/bloc/similar_movies_cubit.dart';
import 'package:movie_app/presentation/watch/bloc/similar_movies_state.dart';

class SimilarMovies extends StatelessWidget {
  final int id;
  const SimilarMovies({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SimilarMoviesCubit>(
      create:
          (context) => SimilarMoviesCubit()..getSimilarMovies(id),
      child: BlocBuilder<SimilarMoviesCubit, SimilarMovieState>(
        builder: (context, state) {
          if (state is SimilarMovieLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is SimilarMovieLoaded) {
            return Column(
              children: [
                Text(
                  'Similar',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Gap(20),
                SizedBox(
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
                ),
              ],
            );
          } else if (state is FailureLoadSimilarMovie) {
            return Text(state.errorMessage);
          }
          return Container();
        },
      ),
    );
  }
}
