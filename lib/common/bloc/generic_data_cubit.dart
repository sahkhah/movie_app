import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/bloc/generic_data_state.dart';
import 'package:movie_app/core/usecase/usecase.dart';


class GenericDataCubit extends Cubit<GenericDataState> {
  GenericDataCubit() : super(GenericDataLoading());
 
  void getData<T>(Usecase usecase, {dynamic id}) async {
    var result = await usecase.call();
    result.fold(
      (error) {
        emit(FailureLoadGenericData(errorMessage: error));
      },
      (data) {
        emit(GenericDataLoaded(data: data));
      },
    );
  }
}
 