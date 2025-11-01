// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:movie_app/data/models/auth/signin_req_param.dart';
import 'package:movie_app/data/models/auth/signup_req_param.dart';
import 'package:movie_app/data/source/auth/auth_api_service.dart';
import 'package:movie_app/domain/auth/repository/auth.dart';
import 'package:movie_app/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signup(SignupReqParam param) async {
    var data = await sl<AuthApiService>().siginup(param);
    return data.fold(
      (error) {
        return Left(error);
      },
      (data) async {
        final sharedPref = await SharedPreferences.getInstance();
        sharedPref.setString('token', data['user']['token'] ?? '123456q2');
        return Right(data);
      },
    );
  }

  @override
  Future<Either> signIn(SignInReqParam param) async {
    var data = await sl<AuthApiService>().siginIn(param);
    return data.fold(
      (error) {
        return Left(error);
      },
      (data) async {
        final sharedPref = await SharedPreferences.getInstance();
        sharedPref.setString('token', data['user']['token'] ?? '123456q2');
        return Right(data);
      },
    );
  }

  @override
  Future<bool> isLoggedIn() async {
    final sharedpref = await SharedPreferences.getInstance();
    String? token = sharedpref.getString('token');
   
    if (token != null) {
      return true;
    } else {
      return false;
    }
  }
}
