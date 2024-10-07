import 'package:animate_do/animate_do.dart';
import 'package:flimrize/features/movies/presentation/widgets/custom_shader_mask.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/movie_details.dart';

class MovieDetailPoster extends StatelessWidget {
  const MovieDetailPoster({
    super.key,
    required this.movieDetail,
  });

  final MovieDetails movieDetail;

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      child: CustomShaderMask(
        posterPath: movieDetail.posterPath,
      ),
    );
    // return CachedNetworkImage(
    //   imageUrl: ApiConstants.getImageUrl(movieDetail.posterPath),
    //   height: 390.h,
    //   width: double.infinity,
    //   fit: BoxFit.cover,
    //   placeholder: (context, url) => const Center(
    //     child: CircularProgressIndicator(),
    //   ),
    //   errorWidget: (context, url, error) => Icon(
    //     Icons.error,
    //     size: 50.sp,
    //   ),
    // );
  }
}
