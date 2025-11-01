import 'package:dartz/dartz.dart';
import 'package:movie_app/core/usecase/usecase.dart';
import 'package:movie_app/data/auth/models/signup_req_param.dart';
import 'package:movie_app/domain/auth/repository/auth.dart';
import 'package:movie_app/service_locator.dart';

class SignupUsecase extends Usecase<Either, SignupReqParam> {
 
  @override
  Future<Either> call({SignupReqParam? params}) async {
    return await sl<AuthRepository>().signup(params!);
   
  }
}
