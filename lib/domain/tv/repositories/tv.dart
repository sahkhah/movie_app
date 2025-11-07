import 'package:dartz/dartz.dart';

abstract class TVRepository {
  Future<Either> getPopularTV();
  Future<Either> searchTV(String query);
}
