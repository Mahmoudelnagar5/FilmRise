import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/api_constants.dart';
import '../../../../core/utils/app_styles.dart';
import '../../domain/entities/cast.dart';
import 'movie_loading_shimmer.dart';

class CastItem extends StatelessWidget {
  const CastItem({super.key, required this.cast});
  final Cast cast;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          left: 35,
          top: 0,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
              color: Colors.grey.shade800,
            ),
            constraints: const BoxConstraints(
              maxHeight: 40,
              maxWidth: 130,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Column(
                children: [
                  Expanded(
                    child: Text(
                      cast.name,
                      style: AppStyles.styleRegular12.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Expanded(
                    child: Text(
                      cast.character,
                      style: AppStyles.styleRegular12.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 1,
                      softWrap: true,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          left: 14,
          bottom: 25,
          child: CircleAvatar(
            minRadius: 18,
            maxRadius: 24,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100.0),
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                width: 50.0,
                imageUrl: ApiConstants.getImageUrl(cast.profilePath),
                placeholder: (context, url) => const MovieLoadingShimmer(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
