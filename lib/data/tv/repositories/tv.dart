import 'package:dartz/dartz.dart';
import 'package:movie_app/common/helper/mapper/movie_mapper.dart';
import 'package:movie_app/data/movies/models/movie.dart';
import 'package:movie_app/data/tv/sources/tv_service.dart';
import 'package:movie_app/domain/tv/repositories/tv.dart';
import 'package:movie_app/service_locator.dart';

class TVRepositoryImpl extends TVRepository {
  @override
  Future<Either> getPopularTV() async {
    final returnedData = await sl<TVApiService>().getPopularTV();
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
