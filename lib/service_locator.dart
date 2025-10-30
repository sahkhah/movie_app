import 'package:get_it/get_it.dart';
import 'package:movie_app/core/network/dio_client.dart';
import 'package:movie_app/data/repositories/auth/auth.dart';
import 'package:movie_app/data/source/auth/auth_api_service.dart';
import 'package:movie_app/domain/auth/repository/auth.dart';
import 'package:movie_app/domain/auth/usecases/is_logged_in.dart';
import 'package:movie_app/domain/auth/usecases/signin.dart';
import 'package:movie_app/domain/auth/usecases/signup.dart';

final sl = GetIt.instance;

void setUpServiceLocator() {
  sl.registerSingleton<DioClient>(DioClient());

  //Service
  sl.registerSingleton<AuthApiService>(AuthApiServiceImpl());

  //Repository
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());

  //Usecase
  sl.registerSingleton<SignupUsecase>(
    SignupUsecase(),
  );
  //Usecase- Signin
  sl.registerSingleton<SignInUsecase>(
    SignInUsecase(),
  );
  //Usecase- isLoggedIn
  sl.registerSingleton<IsLoggedInUsecase>(
    IsLoggedInUsecase(),
  );
}
