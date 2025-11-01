import 'package:dartz/dartz.dart';
import 'package:movie_app/data/movies/sources/movie_api_service.dart';
import 'package:movie_app/domain/movies/repositories/movie.dart';
import 'package:movie_app/service_locator.dart';

class MovieRepositoryImpl extends MovieRepository {
  @override
  Future<Either> getTrending() async {
    return await sl<MovieApiService>().getTrendingMovies();
  }
}
