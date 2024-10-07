import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TrailerViewBody extends StatelessWidget {
  const TrailerViewBody({super.key, required this.id});
  final String id;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: YoutubePlayer(
            controller: YoutubePlayerController(
              initialVideoId: id,
              flags: const YoutubePlayerFlags(
                autoPlay: true,
              ),
            ),
          ),
        ),
        //close button
        Positioned(
          top: 40,
          right: 20,
          child: IconButton(
            icon: const Icon(Icons.close_sharp),
            color: Colors.white,
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
      ],
    );
  }
}
