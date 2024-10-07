import 'package:flutter/material.dart';

import 'movie_item_loading_shimmer.dart';

class MoviesLoading extends StatelessWidget {
  const MoviesLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170.0,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(
          width: 8,
        ),
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        itemCount: 5,
        itemBuilder: (context, index) {
          return const MovieItemLoadingShimmer();
        },
      ),
    );
  }
}
