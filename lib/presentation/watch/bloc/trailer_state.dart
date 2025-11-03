// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chewie/chewie.dart';

abstract class TrailerState {}

class TrailerLoading extends TrailerState {}

class TrailerLoaded extends TrailerState {
  final ChewieController chewieController;
  TrailerLoaded({required this.chewieController});
}

class FailureLoadTrailer extends TrailerState {
  final String errorMessage;
  FailureLoadTrailer({
    required this.errorMessage,
  });
  
}
