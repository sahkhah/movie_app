import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/domain/tv/usecases/get_popular_tv.dart';
import 'package:movie_app/presentation/home/bloc/popular_tv_state.dart';
import 'package:movie_app/service_locator.dart';

class PopularTVsCubit extends Cubit<PopularTVState> {
  PopularTVsCubit() : super(PopularTVLoading());

  void getPopularTVs() async {
    var result = await sl<GetPopularTVUsecase>().call();
    result.fold(
      (error) {
        emit(FailureLoadPopularTV(errorMessage: error));
      },
      (data) {
        emit(PopularTVLoaded(tv: data));
      },
    );
  }
}
