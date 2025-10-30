import 'package:dartz/dartz.dart';
import 'package:movie_app/data/models/auth/signin_req_param.dart';
import 'package:movie_app/data/models/auth/signup_req_param.dart';

abstract class AuthRepository {
  Future<Either> signup(SignupReqParam param);

  Future<Either> signIn(SignInReqParam param);
}
