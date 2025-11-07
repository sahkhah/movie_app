import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:movie_app/core/config/theme/app_color.dart';
import 'package:movie_app/presentation/search/bloc/search_cubit.dart';
import 'package:movie_app/presentation/search/bloc/search_option_cubit.dart';

class SearchOption extends StatelessWidget {
  const SearchOption({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchOptionCubit, SearchType>(
      builder: (context, state) {
        return Row(
          children: [
            GestureDetector(
              onTap: () {
                context.read<SearchOptionCubit>().selectMovie();
                context.read<SearchCubit>().search(
                  context.read<SearchCubit>().controller.text,
                  context.read<SearchOptionCubit>().state,
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color:
                      context.read<SearchOptionCubit>().state ==
                              SearchType.movies
                          ? AppColors.primary
                          : Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(child: Text('Movies')),
              ),
            ),
            Gap(20),
            GestureDetector(
              onTap: () {
                context.read<SearchOptionCubit>().selectTV();
                 context.read<SearchCubit>().search(
                  context.read<SearchCubit>().controller.text,
                  context.read<SearchOptionCubit>().state,
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color:
                      context.read<SearchOptionCubit>().state == SearchType.tv
                          ? AppColors.primary
                          : Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(child: Text('TV')),
              ),
            ),
          ],
        );
      },
    );
  }
}
