import 'package:dartz/dartz.dart';
import 'package:movie_app/common/helper/mapper/movie_mapper.dart';
import 'package:movie_app/common/helper/mapper/trailer_mapper.dart';
import 'package:movie_app/core/model/trailer_model.dart';
import 'package:movie_app/data/movies/models/movie.dart';
import 'package:movie_app/data/movies/sources/movie_api_service.dart';
import 'package:movie_app/domain/movies/repositories/movie.dart';
import 'package:movie_app/service_locator.dart';

class MovieRepositoryImpl extends MovieRepository {
  @override
  Future<Either> getTrendingMovies() async {
    var returnedData = await sl<MovieApiService>().getTrendingMovies();
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var movies =
            List.from(data['content']).map((element) {
              return MovieMapper.toEntity(MovieModel.fromJson(element));
            }).toList();
        return Right(movies);
      },
    );
  }

  @override
  Future<Either> getNowPlayingMovies() async {
    var returnedData = await sl<MovieApiService>().getNowPlayingMovies();
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var movies =
            List.from(data['content']).map((element) {
              return MovieMapper.toEntity(MovieModel.fromJson(element));
            }).toList();
        return Right(movies);
      },
    );
  }

  @override
  Future<Either> getMovieTrailer(int movieId) async {
    var returnedData = await sl<MovieApiService>().getMovieTrailer(movieId);
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var movies = TrailerMapper.toEntity(
          TrailerModel.fromJson(data['trailer']),
        );
        return Right(movies);
      },
    );
  }

  @override
  Future<Either> getRecommendationMovies(int movieId) async {
    var returnedData = await sl<MovieApiService>().getRecommendationMovies(
      movieId,
    );
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var movies =
            List.from(data['content']).map((element) {
              return MovieMapper.toEntity(MovieModel.fromJson(element));
            }).toList();
        return Right(movies);
      },
    );
  }
}
