import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

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
                decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(10),),
               child: Center(child: Text('Movies')),
              ),
              Gap(20),
               Container(
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(child: Text('Movies')),
              ),
            ],
          )
        ],
      ),

    );
  }
}