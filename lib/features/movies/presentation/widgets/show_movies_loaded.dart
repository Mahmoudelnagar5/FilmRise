import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routing/app_router.dart';
import '../../domain/entities/movie.dart';
import 'show_movie_item.dart';

class ShowMoviesLoaded extends StatelessWidget {
  const ShowMoviesLoaded({super.key, required this.movies});
  final List<Movie> movies;
  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(height: 20);
      },
      itemCount: movies.length,
      itemBuilder: (BuildContext context, int index) {
        return FadeInRight(
          duration: const Duration(milliseconds: 1000),
          child: InkWell(
            onTap: () {
              GoRouter.of(context).push(
                AppRouter.movieDetailsView,
                extra: movies[index].id,
              );
            },
            child: ShowMoviesItem(
              movie: movies[index],
            ),
          ),
        );
      },
    );
  }
}
