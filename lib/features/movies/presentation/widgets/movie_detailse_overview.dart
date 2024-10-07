import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_styles.dart';
import '../../domain/entities/movie_details.dart';
import 'movie_details_overview_header.dart';

class MovieDetailsOverview extends StatelessWidget {
  const MovieDetailsOverview({super.key, required this.movieDetail});
  final MovieDetails movieDetail;
  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      from: 20,
      duration: const Duration(milliseconds: 1000),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MovieDetailsOverviewHeader(
              movieDetail: movieDetail,
            ),
            const SizedBox(height: 14),
            FadeInUp(
              duration: const Duration(milliseconds: 1100),
              child: Text(
                movieDetail.overview,
                style: AppStyles.styleRegular12.copyWith(
                  fontSize: 12,
                  color: Colors.grey.shade400,
                ),
                softWrap: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
