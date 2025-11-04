import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:movie_app/common/widgets/movie/movie_card.dart';
import 'package:movie_app/presentation/watch/bloc/recommendation_movie_cubit.dart';
import 'package:movie_app/presentation/watch/bloc/recommendation_movie_state.dart';

class RecommendationMovies extends StatelessWidget {
  final int id;
  const RecommendationMovies({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RecommendationMoviesCubit>(
      create:
          (context) => RecommendationMoviesCubit()..getRecommendationMovies(id),
      child: BlocBuilder<RecommendationMoviesCubit, RecommendationMovieState>(
        builder: (context, state) {
          if (state is RecommendationMovieLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is RecommendationMovieLoaded) {
            return Column(
              children: [
                Text('Recommendation', style: Theme.of(context).textTheme.bodyMedium,),
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
          } else if (state is FailureLoadRecommendationMovie) {
            return Text(state.errorMessage);
          }
          return Container();
        },
      ),
    );
  }
}
