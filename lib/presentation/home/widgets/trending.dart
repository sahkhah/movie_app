import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/config/assets/app_images.dart';
import 'package:movie_app/presentation/home/bloc/trending_cubit.dart';
import 'package:movie_app/presentation/home/bloc/trending_state.dart';

class TrendingMovies extends StatelessWidget {
  const TrendingMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TrendingMovieCubit>(
      create: (context) => TrendingMovieCubit()..getTrendingMovies(),
      child: BlocBuilder<TrendingMovieCubit, TrendingMovieState>(
        builder: (context, state) {
          if (state is TrendingMovieLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is TrendingMovieLoaded) {
            return FanCarouselImageSlider.sliderType1(
              imagesLink: state.movies.map((element)=>AppImages.movieImageBasePath + element.posterPath.toString()).toList(), 
              isAssets: false,
              autoPlay: false,
              sliderHeight: 400,
              showIndicator: true,
              );
          } else if (state is FailureLoadTrendingMovie) {
            return Text(state.errorMessage);
          }
          return Container();
        },
      ),
    );
  }
}
