import 'package:dartz/dartz.dart';
import 'package:movie_app/common/helper/mapper/movie_mapper.dart';
import 'package:movie_app/data/movies/models/movie.dart';
import 'package:movie_app/data/movies/sources/movie_api_service.dart';
import 'package:movie_app/domain/movies/repositories/movie.dart';
import 'package:movie_app/service_locator.dart';

class MovieRepositoryImpl extends MovieRepository {
  @override
  Future<Either> getTrending() async {
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
}
