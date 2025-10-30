import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/core/constants/app_url/app_url.dart';
import 'package:movie_app/core/network/dio_client.dart';
import 'package:movie_app/data/models/auth/signin_req_param.dart';
import 'package:movie_app/data/models/auth/signup_req_param.dart';
import 'package:movie_app/service_locator.dart';

abstract class AuthApiService {
  Future<Either> siginup(SignupReqParam param);
  Future<Either> siginIn(SignInReqParam param);
}

class AuthApiServiceImpl extends AuthApiService {
  @override
  Future<Either> siginup(SignupReqParam param) async {
    try {
      var response =  await sl<DioClient>().post(AppUrl.signup, data: param.toMap());
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }
  
  @override
  Future<Either> siginIn(SignInReqParam param) async {
    try {
      var response =  await sl<DioClient>().post(AppUrl.signin, data: param.toMap());
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }
}
