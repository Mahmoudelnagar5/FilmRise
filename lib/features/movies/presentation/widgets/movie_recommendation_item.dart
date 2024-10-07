import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flimrize/core/utils/api_constants.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../domain/entities/recommendation.dart';

class MovieRecommendationItem extends StatelessWidget {
  const MovieRecommendationItem({
    super.key,
    required this.recommendation,
  });
  final Recommendation recommendation;
  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      from: 20,
      duration: const Duration(milliseconds: 000),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(4.0)),
        child: CachedNetworkImage(
          imageUrl: ApiConstants.getImageUrl(recommendation.posterPath),
          placeholder: (context, url) => Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.white,
            child: Container(
              height: 170.0,
              width: 120.0,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
          height: 180.0,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
