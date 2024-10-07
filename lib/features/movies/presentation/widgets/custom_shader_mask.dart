import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/api_constants.dart';

class CustomShaderMask extends StatelessWidget {
  const CustomShaderMask({
    super.key,
    required this.posterPath,
  });
  final String? posterPath;
  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (rect) {
        return const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            // fromLTRB
            Colors.black,
            Colors.black,
            Colors.black,
            Colors.transparent,
          ],
          stops: [0, .3, 0.5, 1],
        ).createShader(
          Rect.fromLTRB(0, 0, rect.width, rect.height),
        );
      },
      blendMode: BlendMode.dstIn,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        child: CachedNetworkImage(
          height: MediaQuery.of(context).size.height * 0.43,
          // height: 560.0.h,
          width: double.infinity,
          imageUrl: ApiConstants.getImageUrl(
              posterPath ?? '/58QT4cPJ2u2TqWZkterDq9q4yxQ.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
