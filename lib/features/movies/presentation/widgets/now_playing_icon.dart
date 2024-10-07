import 'package:flutter/material.dart';
import 'package:neon_widgets/neon_widgets.dart';

class NowPlayingIcon extends StatelessWidget {
  const NowPlayingIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FlickerNeonContainer(
      borderRadius: BorderRadius.circular(100),
      spreadColor: Colors.red,
      borderWidth: 0.5,
      borderColor: Colors.redAccent,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.red,
        ),
        child: const Icon(
          Icons.circle,
          color: Colors.red,
          size: 11,
        ),
      ),
    );
  }
}
