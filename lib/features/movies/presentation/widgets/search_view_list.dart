import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routing/app_router.dart';
import '../../domain/entities/movie.dart';
import 'search_item.dart';

class SearchViewList extends StatelessWidget {
  const SearchViewList({super.key, required this.movies});
  final List<Movie> movies;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      physics: const BouncingScrollPhysics(),
      itemCount: movies.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            GoRouter.of(context).push(
              AppRouter.movieDetailsView,
              extra: movies[index].id,
            );
          },
          child: movies[index].backdropPath == null
              ? const SizedBox()
              : Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: SearchItem(
                    movie: movies[index],
                  ),
                ),
        );
      },
    );
  }
}
