import 'package:flutter/material.dart';
import 'package:movie_app/common/widgets/basic_appbar.dart';
import 'package:movie_app/domain/movies/entities/movies.dart';

class MovieWatch extends StatelessWidget {
  final MovieEntity movieEntity;
  const MovieWatch({super.key, required this.movieEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: BasicAppBar(hideback: false));
  }
}
