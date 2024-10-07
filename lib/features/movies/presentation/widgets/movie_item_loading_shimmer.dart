import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MovieItemLoadingShimmer extends StatelessWidget {
  const MovieItemLoadingShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade200,
      highlightColor: Colors.white,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(8),
        ),
        width: 125.0,
      ),
    );
  }
}
