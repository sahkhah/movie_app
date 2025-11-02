import 'package:get_it/get_it.dart';
import 'package:movie_app/core/network/dio_client.dart';
import 'package:movie_app/data/auth/repositories/auth.dart';
import 'package:movie_app/data/auth/source/auth_api_service.dart';
import 'package:movie_app/data/movies/repositories/movies.dart';
import 'package:movie_app/data/movies/sources/movie_api_service.dart';
import 'package:movie_app/data/tv/repositories/tv.dart';
import 'package:movie_app/data/tv/sources/tv_service.dart';
import 'package:movie_app/domain/auth/repository/auth.dart';
import 'package:movie_app/domain/auth/usecases/is_logged_in.dart';
import 'package:movie_app/domain/auth/usecases/signin.dart';
import 'package:movie_app/domain/auth/usecases/signup.dart';
import 'package:movie_app/domain/movies/repositories/movie.dart';
import 'package:movie_app/domain/movies/usecases/get_now_playing_movies.dart';
import 'package:movie_app/domain/movies/usecases/get_trending_movies.dart';
import 'package:movie_app/domain/tv/repositories/tv.dart';
import 'package:movie_app/domain/tv/usecases/get_popular_tv.dart';

final sl = GetIt.instance;

void setUpServiceLocator() {
  sl.registerSingleton<DioClient>(DioClient());

  //Service
  sl.registerSingleton<AuthApiService>(AuthApiServiceImpl());
  sl.registerSingleton<MovieApiService>(MovieApiServiceImpl());
  sl.registerSingleton<TVApiService>(TVApiServiceImpl());

  //Repository
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<MovieRepository>(MovieRepositoryImpl());
  sl.registerSingleton<TVRepository>(TVRepositoryImpl());

  //Usecase
  sl.registerSingleton<SignupUsecase>(SignupUsecase());
  //Usecase- Signin
  sl.registerSingleton<SignInUsecase>(SignInUsecase());
  //Usecase- isLoggedIn
  sl.registerSingleton<IsLoggedInUsecase>(IsLoggedInUsecase());
  //Usecase- movies
  sl.registerSingleton<GetTrendingMoviesUsecase>(GetTrendingMoviesUsecase());
  sl.registerSingleton<GetNowPlayingMoviesUsecase>(GetNowPlayingMoviesUsecase());
  sl.registerSingleton<GetPopularTVUsecase>(GetPopularTVUsecase());
}
