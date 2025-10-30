import 'package:dartz/dartz.dart';
import 'package:movie_app/core/usecase/signin_usecase.dart';
import 'package:movie_app/data/models/auth/signin_req_param.dart';
import 'package:movie_app/domain/auth/repository/auth.dart';


class SignInUsecase extends Usecase<Either, SignInReqParam> {
  final AuthRepository authRepository;

  SignInUsecase({required this.authRepository});
  @override
  Future<Either> call({SignInReqParam? params}) async {
    //sl<AuthRepository>().signup(params!);
    return await authRepository.signIn(params!);
  }
}
