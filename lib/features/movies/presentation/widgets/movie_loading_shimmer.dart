import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MovieLoadingShimmer extends StatelessWidget {
  const MovieLoadingShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade200,
      highlightColor: Colors.white,
      child: Container(
        width: 70.0,
        height: 130.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}
