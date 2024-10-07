import 'package:flimrize/features/movies/presentation/widgets/top_rated_list_view.dart';
import 'package:flutter/material.dart';
import '../widgets/now_playing_movies.dart';
import '../widgets/popular_moveis_list_view.dart';
import '../widgets/movies_header.dart';

class MovieView extends StatelessWidget {
  const MovieView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      key: Key('movieScrollView'),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.0),
            NowPlayingMovies(),
            MoviesHeader(
              title: 'Popular',
              isSelected: 1,
            ),
            PopularMoveisListView(),
            MoviesHeader(
              title: 'Top Rated',
              isSelected: 2,
            ),
            TopRatedListView(),
            SizedBox(height: 5.0),
          ],
        ),
      ),
    );
  }
}
