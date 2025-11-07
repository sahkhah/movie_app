import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/presentation/search/bloc/search_cubit.dart';
import 'package:movie_app/presentation/search/bloc/search_option_cubit.dart';

class SearchTextfield extends StatelessWidget {
  const SearchTextfield({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),

      child: TextField(
        controller: context.read<SearchCubit>().controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Enter title',
        ),
        onChanged: (value) {
          context.read<SearchCubit>().search(
            value,
            context.read<SearchOptionCubit>().state,
          );
        },
      ),
    );
  }
}
