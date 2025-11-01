import 'package:dartz/dartz.dart';
import 'package:movie_app/data/auth/models/signin_req_param.dart';
import 'package:movie_app/data/auth/models/signup_req_param.dart';

abstract class AuthRepository {
  Future<Either> signup(SignupReqParam param);

  Future<Either> signIn(SignInReqParam param);

  Future<bool> isLoggedIn();
}
