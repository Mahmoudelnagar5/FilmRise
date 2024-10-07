import 'package:flimrize/core/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'custom_shader_mask.dart';
import 'now_playing_movies_header.dart';

class NowPlayingMoviesItem extends StatelessWidget {
  const NowPlayingMoviesItem({
    super.key,
    required this.item,
  });
  final dynamic item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(
          AppRouter.movieDetailsView,
          extra: item.id,
        );
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          CustomShaderMask(
            posterPath: item.posterPath,
          ),
          NowPlayingMoviesHeader(
            movie: item,
          ),
        ],
      ),
    );
  }
}
