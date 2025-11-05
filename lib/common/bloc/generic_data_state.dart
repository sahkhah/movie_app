abstract class GenericDataState {}

class GenericDataLoading extends GenericDataState {}

class GenericDataLoaded<T> extends GenericDataState {
  final T data;
  GenericDataLoaded({required this.data});
}

class FailureLoadGenericData extends GenericDataState {
  final String errorMessage;

  FailureLoadGenericData({required this.errorMessage});
}
