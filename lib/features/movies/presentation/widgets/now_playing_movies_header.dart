import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:neon_widgets/neon_widgets.dart';

import '../../domain/entities/movie.dart';
import 'now_playing_icon.dart';

class NowPlayingMoviesHeader extends StatelessWidget {
  const NowPlayingMoviesHeader({super.key, required this.movie});
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      left: 0,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ShakeX(
              infinite: true,
              duration: const Duration(milliseconds: 2000),
              child: const NowPlayingIcon(),
            ),
            const SizedBox(width: 4.0),
            const FlickerNeonText(
              text: "NOW PLAYING",
              flickerTimeInMilliSeconds: 800,
              fontWeight: FontWeight.bold,
              spreadColor: Colors.red,
              blurRadius: 25,
              textSize: 19,
              letterSpacing: 5,
            ),
          ],
        ),
      ),
    );
  }
}
