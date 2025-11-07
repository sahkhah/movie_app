import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/widgets/basic_appbar.dart';
import 'package:movie_app/presentation/search/bloc/search_cubit.dart';
import 'package:movie_app/presentation/search/bloc/search_option_cubit.dart';
import 'package:movie_app/presentation/search/widget/search_content.dart';
import 'package:movie_app/presentation/search/widget/search_option.dart';
import 'package:movie_app/presentation/search/widget/search_textfield.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(hideback: true),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => SearchOptionCubit()),
          BlocProvider(create: (context) => SearchCubit()),
        ],

        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
             SearchTextfield(),
            SearchOption(),
            SearchContent(),
          ]),
        ),
      ),
    );
  }
}
