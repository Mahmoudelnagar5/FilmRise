import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'now_playing_movies_items.dart';
import 'now_playing_movies_shimmer.dart';

class NowPlayingMoviesLoading extends StatelessWidget {
  const NowPlayingMoviesLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: List.generate(
        5,
        (index) => const NowPlaingMoviesShimmer(),
      ),
      options: carouselOptions(context),
    );
  }
}
