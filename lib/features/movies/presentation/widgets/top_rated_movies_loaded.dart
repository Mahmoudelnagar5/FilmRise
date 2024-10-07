import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routing/app_router.dart';
import '../../domain/entities/movie.dart';
import 'movie_item.dart';

class TopRatedMoviesLoaded extends StatelessWidget {
  const TopRatedMoviesLoaded({super.key, required this.movies});
  final List<Movie> movies;
  @override
  Widget build(BuildContext context) {
    return FadeIn(
      duration: const Duration(milliseconds: 500),
      child: SizedBox(
        height: 170.0,
        child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(
            width: 8.0,
          ),
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          itemCount: movies.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                GoRouter.of(context).push(
                  AppRouter.movieDetailsView,
                  extra: movies[index].id,
                );
              },
              child: MovieItem(
                movie: movies[index],
                width: 125,
              ),
            );
          },
        ),
      ),
    );
  }
}
