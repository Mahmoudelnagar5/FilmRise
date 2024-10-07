import 'package:flutter/material.dart';
import '../../../../core/utils/app_styles.dart';

class ShowMoviesSliverAppBar extends StatelessWidget {
  const ShowMoviesSliverAppBar({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      snap: true,
      floating: true,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          title,
          style: AppStyles.styleBold19.copyWith(
            letterSpacing: 0.15,
          ),
        ),
        centerTitle: true,
      ),
    );
  }
}
