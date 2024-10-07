import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/utils/app_styles.dart';

class DateAndRatingMovie extends StatelessWidget {
  const DateAndRatingMovie({
    super.key,
    required this.movie,
  });

  final dynamic movie;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          alignment: Alignment.center,
          width: 62,
          height: 24,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.red,
          ),
          child: Text(
            DateFormat.yMMM().format(DateTime.parse(
                movie.releaseDate == '' ? '2022-02-23' : movie.releaseDate)),
            style: AppStyles.styleBold12.copyWith(
              fontSize: 11,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Roulette(
          child: const Icon(
            Icons.star,
            color: Color(0xffFF8700),
            size: 16,
          ),
        ),
        const SizedBox(width: 5),
        Text(
          movie.voteAverage.toStringAsFixed(1),
          style: AppStyles.styleBold14,
        ),
      ],
    );
  }
}
