import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class VideoOverview extends StatelessWidget {
  final String overview;
  const VideoOverview({super.key, required this.overview});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Overview',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Gap(5),
        Text(overview, style: Theme.of(context).primaryTextTheme.bodyMedium),
      ],
    );
  }
}
