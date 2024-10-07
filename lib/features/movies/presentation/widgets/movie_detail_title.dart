import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_styles.dart';

class MovieDetailsTitle extends StatelessWidget {
  const MovieDetailsTitle({
    super.key,
    required this.title,
  });

  final String title;
  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      duration: const Duration(milliseconds: 1000),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            title,
            style: AppStyles.styleBold19,
          ),
        ),
      ),
    );
  }
}
