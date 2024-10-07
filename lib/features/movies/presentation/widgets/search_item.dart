import 'package:flutter/material.dart';

import '../../domain/entities/movie.dart';
import 'date_and_rating_movie.dart';
import 'movie_item.dart';
import 'overview_movie.dart';
import 'title_movie.dart';

class SearchItem extends StatelessWidget {
  const SearchItem({
    super.key,
    required this.movie,
  });
  final Movie movie;
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
              height: 125,
              movie: movie,
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                TitleMovie(
                  movie: movie,
                  width: .55,
                ),
                const SizedBox(height: 10),
                DateAndRatingMovie(movie: movie),
                const SizedBox(height: 10),
                OverviewMovie(
                  movie: movie,
                  width: .55,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
