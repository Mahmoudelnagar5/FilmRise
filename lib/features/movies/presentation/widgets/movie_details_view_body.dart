import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_styles.dart';
import '../../domain/entities/cast.dart';
import '../../domain/entities/movie_details.dart';
import '../../domain/entities/recommendation.dart';
import 'cast_list.dart';
import 'movie_detail_bar.dart';
import 'movie_detail_poster.dart';
import 'movie_detail_title.dart';
import 'movie_details_recommendation.dart';
import 'movie_details_row.dart';
import 'movie_detailse_overview.dart';

class MovieDetailsViewBody extends StatelessWidget {
  const MovieDetailsViewBody({
    super.key,
    required this.movieDetail,
    required this.movieRecommendation,
    required this.casts,
  });

  final MovieDetails movieDetail;
  final List<Recommendation> movieRecommendation;
  final List<Cast> casts;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            MovieDetailPoster(movieDetail: movieDetail),
            SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 15),
                    child: MovieDetailsBar(),
                  ),
                  MovieDetailsRow(movieDetail: movieDetail),
                  const SizedBox(height: 10),
                  MovieDetailsTitle(title: movieDetail.title),
                  const SizedBox(height: 14),
                  MovieDetailsOverview(movieDetail: movieDetail),
                  const SizedBox(height: 14),
                  _buildSectionTitle('Casts'),
                  const SizedBox(height: 14),
                  CastList(casts: casts),
                  const SizedBox(height: 14),
                  _buildSectionTitle('More Like This'),
                  const SizedBox(height: 14),
                  MovieDetailsRecommendation(
                      movieRecommendation: movieRecommendation),
                  const SizedBox(height: 14),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: JelloIn(
        child: Text(
          title.toUpperCase(),
          style: AppStyles.styleMedium16.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
