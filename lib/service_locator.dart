import 'package:get_it/get_it.dart';
import 'package:movie_app/core/network/dio_client.dart';
import 'package:movie_app/data/auth/repositories/auth.dart';
import 'package:movie_app/data/auth/source/auth_api_service.dart';
import 'package:movie_app/data/movies/repositories/movies.dart';
import 'package:movie_app/data/movies/sources/movie_api_service.dart';
import 'package:movie_app/domain/auth/repository/auth.dart';
import 'package:movie_app/domain/auth/usecases/is_logged_in.dart';
import 'package:movie_app/domain/auth/usecases/signin.dart';
import 'package:movie_app/domain/auth/usecases/signup.dart';
import 'package:movie_app/domain/movies/repositories/movie.dart';
import 'package:movie_app/domain/movies/usecases/movies.dart';

final sl = GetIt.instance;

void setUpServiceLocator() {
  sl.registerSingleton<DioClient>(DioClient());

  //Service
  sl.registerSingleton<AuthApiService>(AuthApiServiceImpl());
  sl.registerSingleton<MovieApiService>(MovieApiServiceImpl());

  //Repository
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<MovieRepository>(MovieRepositoryImpl());

  //Usecase
  sl.registerSingleton<SignupUsecase>(SignupUsecase());
  //Usecase- Signin
  sl.registerSingleton<SignInUsecase>(SignInUsecase());
  //Usecase- isLoggedIn
  sl.registerSingleton<IsLoggedInUsecase>(IsLoggedInUsecase());
  //Usecase- movies
  sl.registerSingleton<MovieUsecase>(MovieUsecase());
}
