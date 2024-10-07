import 'package:flutter/material.dart';

import '../../domain/entities/cast.dart';
import 'cast_item.dart';

class CastList extends StatelessWidget {
  const CastList({super.key, required this.casts});
  final List<Cast> casts;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: casts.length < 4 ? casts.length : 4,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 12.0,
        crossAxisSpacing: 12.0,
        childAspectRatio: 2.6,
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        return CastItem(
          cast: casts[index],
        );
      },
    );
  }
}
