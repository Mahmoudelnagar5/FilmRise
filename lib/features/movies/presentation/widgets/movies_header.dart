import 'package:animate_do/animate_do.dart';
import 'package:flimrize/features/movies/presentation/views/show_movies_view.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_styles.dart';

class MoviesHeader extends StatelessWidget {
  const MoviesHeader({
    super.key,
    required this.title,
    required this.isSelected,
  });
  final String title;
  final int isSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppStyles.styleSemiBold16.copyWith(
              letterSpacing: 0.15,
              fontSize: 17,
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ShowMoviesView(
                    title: '$title Movies',
                    isSelected: isSelected,
                  ),
                ),
              );
            },
            child: Row(
              children: [
                Text(
                  'See More',
                  style: AppStyles.styleSemiBold16.copyWith(
                    fontSize: 15,
                    letterSpacing: 0.8,
                  ),
                ),
                const SizedBox(width: 2.0),
                Flash(
                  infinite: true,
                  child: const Icon(
                    Icons.arrow_forward_ios,
                    size: 14,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
