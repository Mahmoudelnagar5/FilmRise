import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/api_constants.dart';
import 'movie_loading_shimmer.dart';

class MovieItem extends StatelessWidget {
  const MovieItem({
    super.key,
    required this.movie,
    this.width = 60.0,
    this.height,
    this.radius = 8.0,
  });
  final double width;
  final double? height;
  final dynamic movie;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(
        Radius.circular(radius),
      ),
      child: CachedNetworkImage(
        width: width,
        height: height,
        fit: BoxFit.cover,
        imageUrl: ApiConstants.getImageUrl(movie.posterPath),
        placeholder: (context, url) => const MovieLoadingShimmer(),
        errorWidget: (context, url, error) => const Icon(
          Icons.error,
        ),
      ),
    );
  }
}
