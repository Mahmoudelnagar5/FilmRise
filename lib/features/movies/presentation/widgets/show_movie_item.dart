import 'package:flutter/material.dart';

import 'date_and_rating_movie.dart';
import 'movie_item.dart';
import 'overview_movie.dart';
import 'title_movie.dart';

class ShowMoviesItem extends StatelessWidget {
  const ShowMoviesItem({
    super.key,
    required this.movie,
  });
  final dynamic movie;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MovieItem(
              width: 100,
              height: 140,
              movie: movie,
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                TitleMovie(movie: movie),
                const SizedBox(height: 10),
                DateAndRatingMovie(movie: movie),
                const SizedBox(height: 10),
                OverviewMovie(movie: movie),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
