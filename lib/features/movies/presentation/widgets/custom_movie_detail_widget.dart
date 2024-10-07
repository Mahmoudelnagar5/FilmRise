import 'package:flutter/material.dart';

import '../../../../core/utils/app_styles.dart';

class CustomMovieDetailsWidget extends StatelessWidget {
  const CustomMovieDetailsWidget({
    super.key,
    required this.text,
    required this.icon,
  });

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 20,
        ),
        const SizedBox(width: 10),
        Text(
          text,
          style: AppStyles.styleMedium12.copyWith(
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}
