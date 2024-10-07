import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../../../core/helper/show_duration.dart';
import '../../domain/entities/movie_details.dart';
import 'custom_movie_detail_widget.dart';
import 'date_and_rating_movie.dart';
import 'movie_item.dart';

class MovieDetailsRow extends StatelessWidget {
  const MovieDetailsRow({
    super.key,
    required this.movieDetail,
  });

  final MovieDetails movieDetail;

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      duration: const Duration(milliseconds: 1000),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 120,
          left: 14,
          right: 25,
        ),
        child: Row(
          children: [
            MovieItem(
              movie: movieDetail,
              radius: 20,
              height: 250,
              width: 160,
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: FadeInDown(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DateAndRatingMovie(movie: movieDetail),
                    const SizedBox(height: 14),
                    CustomMovieDetailsWidget(
                      icon: Icons.movie_creation_outlined,
                      text: movieDetail.genres[0].name,
                    ),
                    const SizedBox(height: 5),
                    CustomMovieDetailsWidget(
                      icon: Icons.access_time_rounded,
                      text: showDuration(movieDetail.runtime),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
