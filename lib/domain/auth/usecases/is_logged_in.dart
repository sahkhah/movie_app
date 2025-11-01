import 'package:movie_app/core/usecase/usecase.dart';
import 'package:movie_app/domain/auth/repository/auth.dart';
import 'package:movie_app/service_locator.dart';

class IsLoggedInUsecase extends Usecase<bool, dynamic> {
 
  @override
  Future<bool> call({params}) async {
    return await sl<AuthRepository>().isLoggedIn();
  
  }
}
