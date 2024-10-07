import 'package:flutter/material.dart';

import '../../../../core/utils/app_styles.dart';

class OverviewMovie extends StatelessWidget {
  const OverviewMovie({
    super.key,
    required this.movie,
    this.width = 0.58,
  });

  final dynamic movie;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * width,
      child: Text(
        movie.overview,
        style: AppStyles.styleMedium14.copyWith(
          fontSize: 12,
          color: Colors.grey.shade400,
        ),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
