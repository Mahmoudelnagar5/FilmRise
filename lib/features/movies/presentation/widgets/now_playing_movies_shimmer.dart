import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class NowPlaingMoviesShimmer extends StatelessWidget {
  const NowPlaingMoviesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade200,
      highlightColor: Colors.white,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.4,
      ),
    );
  }
}
