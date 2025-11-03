import 'package:dartz/dartz.dart';
import 'package:movie_app/core/usecase/usecase.dart';
import 'package:movie_app/domain/movies/repositories/movie.dart';
import 'package:movie_app/service_locator.dart';

class GetMovieTrailerUsecase extends Usecase<Either, int> {
  @override
  Future<Either> call({int? params}) async{
   
      return await sl<MovieRepository>().getMovieTrailer(params!);
    
  }
 
}
