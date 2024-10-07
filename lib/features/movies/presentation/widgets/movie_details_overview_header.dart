import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_styles.dart';
import '../../domain/entities/movie_details.dart';

class MovieDetailsOverviewHeader extends StatelessWidget {
  const MovieDetailsOverviewHeader({
    super.key,
    required this.movieDetail,
  });
  final MovieDetails movieDetail;
  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      duration: const Duration(milliseconds: 1000),
      child: Row(
        children: [
          Bounce(
            child: Text(
              'Overview'.toUpperCase(),
              style: AppStyles.styleMedium16.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
          ),
          const Spacer(),
          Spin(
            duration: const Duration(milliseconds: 1300),
            child: Container(
              alignment: Alignment.center,
              width: 74,
              height: 27,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.red,
              ),
              child: Text(
                movieDetail.status,
                style: AppStyles.styleMedium14.copyWith(
                  fontSize: 13.5,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
