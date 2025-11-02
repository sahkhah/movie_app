import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/core/constants/app_url/app_url.dart';
import 'package:movie_app/core/network/dio_client.dart';
import 'package:movie_app/service_locator.dart';

abstract class TVApiService {
  Future<Either> getPopularTV();
}

class TVApiServiceImpl extends TVApiService {
  @override
  Future<Either> getPopularTV() async {
    try {
      var response = await sl<DioClient>().get(AppUrl.popularTV);
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }
}
