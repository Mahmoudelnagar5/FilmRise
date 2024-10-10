import 'package:flutter/material.dart';
import 'package:marqueer/marqueer.dart';
import 'dart:math' as math;
import '../../../../core/utils/app_assets.dart';

class CustomMarqueeWidget extends StatelessWidget {
  final MarqueerDirection direction;
  CustomMarqueeWidget({
    super.key,
    required this.direction,
  });
  final List<String> imageAssets = [
    Assets.imagesAlien,
    Assets.imagesAvengers,
    Assets.imagesBreakingBad,
    Assets.imagesInside,
    Assets.imagesIt,
    Assets.imagesMe4,
    Assets.imagesMrRobot,
    Assets.imagesTrap
  ];
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -7 * math.pi / 180,
      child: SizedBox(
        height: 120,
        child: Marqueer.builder(
          pps: 100,
          restartAfterInteractionDuration: const Duration(seconds: 1),
          direction: direction,
          restartAfterInteraction: true,
          interaction: true,
          itemCount: imageAssets.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  imageAssets[index],
                  fit: BoxFit.cover,
                  height: 125,
                  width: 90,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
