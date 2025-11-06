import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_app/common/widgets/basic_appbar.dart';
import 'package:movie_app/core/config/theme/app_color.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(hideback: true,),
      body: Column(
        children: [
          Row(
            children: [
              Container(
                color: AppColors.primary,
              )
            ],
          )
        ],
      ),

    );
  }
}