// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movie_app/presentation/search/bloc/search_cubit.dart';
import 'package:movie_app/presentation/search/bloc/search_state.dart';

class SearchContent extends StatelessWidget {
  final String query;
  const SearchContent({super.key, required this.query});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          if (state is SearchLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is MovieLoaded) {
            return Container();
          } else if (state is TVLoaded) {
            return Container();
          } else if (state is SearchFailed) {
            return Text(state.errorMessage);
          }
          return Container();
        },
      ),
    );
  }
}
