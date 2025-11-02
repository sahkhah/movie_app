import 'package:flutter/material.dart';
import 'package:movie_app/common/widgets/basic_appbar.dart';
import 'package:movie_app/presentation/home/widgets/category_text.dart';
import 'package:movie_app/presentation/home/widgets/now_playing_movies.dart';
import 'package:movie_app/presentation/home/widgets/trending.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(hideback: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CategoryText(title: 'Trending 🔥'),
              const SizedBox(height: 20),
              TrendingMovies(),
              const SizedBox(height: 20),
               CategoryText(title: 'Now Playing'),
               const SizedBox(height: 20,),
               NowPlayingMovies(),
            ],
          ),
        ),
      ),
    );
  }
}
