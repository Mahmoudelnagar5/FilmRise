import 'package:animate_do/animate_do.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/movie.dart';
import 'now_playing_movies_item.dart';

class NowPlayingMoviesItems extends StatelessWidget {
  const NowPlayingMoviesItems({
    super.key,
    required this.movies,
  });
  final List<Movie> movies;
  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      duration: const Duration(milliseconds: 1500),
      child: CarouselSlider(
        items: movies.map(
          (item) {
            return NowPlayingMoviesItem(
              item: item,
            );
          },
        ).toList(),
        options: carouselOptions(context),
      ),
    );
  }
}

CarouselOptions carouselOptions(BuildContext context) {
  return CarouselOptions(
    autoPlayAnimationDuration: const Duration(milliseconds: 600),
    autoPlayCurve: Easing.standardAccelerate,
    enlargeFactor: .28,
    autoPlay: true,
    enlargeCenterPage: true,
    viewportFraction: .72,
    height: MediaQuery.of(context).size.height * 0.43,
  );
}
