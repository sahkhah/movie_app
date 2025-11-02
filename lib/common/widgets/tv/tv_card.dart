import 'package:flutter/material.dart';
import 'package:movie_app/core/config/assets/app_images.dart';
import 'package:movie_app/core/config/theme/app_color.dart';
import 'package:movie_app/domain/tv/entities/tv_entity.dart';

class TVCard extends StatelessWidget {
  final TVEntity tvEntity;
  const TVCard({super.key, required this.tvEntity});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 100,
        decoration: BoxDecoration(
          color: AppColors.secondBackground,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              flex: 4,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                    image: NetworkImage(
                      AppImages.movieImageBasePath + tvEntity.posterPath!,
                    ),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      tvEntity.originalTitle!,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.star, color: Colors.yellow),
                Text(' ${tvEntity.voteAverage!.toStringAsFixed(1)}'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
