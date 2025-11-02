import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/widgets/tv/tv_card.dart';
import 'package:movie_app/presentation/home/bloc/popular_tv_cubit.dart';
import 'package:movie_app/presentation/home/bloc/popular_tv_state.dart';

class PopularTV extends StatelessWidget {
  const PopularTV({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PopularTVCubit>(
      create: (context) => PopularTVCubit()..getPopularTVs(),
      child: BlocBuilder<PopularTVCubit, PopularTVState>(
        builder: (context, state) {
          if (state is PopularTVLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is PopularTVLoaded) {
            return SizedBox(
              height: 300,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, index) {
                  return TVCard(tvEntity: state.tv[index]);
                },
                separatorBuilder: (context, _) => SizedBox(width: 10),
                itemCount: state.tv.length,
              ),
            );
          } else if (state is FailureLoadPopularTV) {
            return Text(state.errorMessage);
          }
          return Container();
        },
      ),
    );
  }
}
