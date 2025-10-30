import 'package:dartz/dartz.dart';
import 'package:movie_app/core/usecase/signin_usecase.dart';
import 'package:movie_app/data/models/auth/signup_req_param.dart';
import 'package:movie_app/domain/auth/repository/auth.dart';
import 'package:movie_app/service_locator.dart';

class SignupUsecase extends Usecase<Either, SignupReqParam> {
  final AuthRepository authRepository;

  SignupUsecase({required this.authRepository});
  @override
  Future<Either> call({SignupReqParam? params}) async {
    //sl<AuthRepository>().signup(params!);
    return await authRepository.signup(params!);
  }
}
