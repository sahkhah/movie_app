import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:movie_app/common/widgets/basic_appbar.dart';
import 'package:movie_app/domain/movies/entities/movies.dart';
import 'package:movie_app/presentation/watch/widgets/movie_title.dart';
import 'package:movie_app/presentation/watch/widgets/recommendation_movie.dart';
import 'package:movie_app/presentation/watch/widgets/video_overview.dart';
import 'package:movie_app/presentation/watch/widgets/video_player.dart';
import 'package:movie_app/presentation/watch/widgets/video_release_date.dart';
import 'package:movie_app/presentation/watch/widgets/video_vote_avg.dart';

class MovieWatch extends StatelessWidget {
  final MovieEntity movieEntity;
  const MovieWatch({super.key, required this.movieEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(hideback: false),
      body: SingleChildScrollView(
        child: Column(
        children: [
          VideoPlayer(id: movieEntity.id!),
          Gap(10),
          MovieTitle(title: movieEntity.title!),
          Gap(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              VideoReleaseDate(releaseDate: movieEntity.releaseDate!),
              VideoVoteAverage(voteAverage: movieEntity.voteAverage!)
            ],
          ),
          VideoOverview(overview: movieEntity.overview!),
          Gap(10),
          RecommendationMovies(id: movieEntity.id!),
        ],
      )),
    );
  }
}
