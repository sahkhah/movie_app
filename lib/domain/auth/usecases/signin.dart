import 'package:dartz/dartz.dart';
import 'package:movie_app/core/usecase/signin_usecase.dart';
import 'package:movie_app/data/models/auth/signin_req_param.dart';
import 'package:movie_app/domain/auth/repository/auth.dart';
import 'package:movie_app/service_locator.dart';


class SignInUsecase extends Usecase<Either, SignInReqParam> {
 
   @override
  Future<Either> call({SignInReqParam? params}) async {
    
    return await sl<AuthRepository>().signIn(params!);
  }
}
