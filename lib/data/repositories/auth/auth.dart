// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:movie_app/data/models/auth/signin_req_param.dart';

import 'package:movie_app/data/models/auth/signup_req_param.dart';
import 'package:movie_app/data/source/auth/auth_api_service.dart';
import 'package:movie_app/domain/auth/repository/auth.dart';
import 'package:movie_app/service_locator.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signup(SignupReqParam param) async {
    return await sl<AuthApiService>().siginup(param);
  }
  
  @override
  Future<Either> signIn(SignInReqParam param) async{
   return await sl<AuthApiService>().siginIn(param);
  }
  
 
}
