import 'package:flutter/material.dart';

import '../../../../core/utils/app_styles.dart';

class TitleMovie extends StatelessWidget {
  const TitleMovie({
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
        movie.title,
        style: AppStyles.styleBold16.copyWith(
          fontSize: 18,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
