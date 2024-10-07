import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routing/app_router.dart';
import '../../domain/entities/recommendation.dart';
import 'movie_recommendation_item.dart';

class MovieDetailsRecommendation extends StatelessWidget {
  const MovieDetailsRecommendation({
    super.key,
    required this.movieRecommendation,
  });

  final List<Recommendation> movieRecommendation;

  @override
  Widget build(BuildContext context) {
    // Limit the number of recommendations shown to 6 for performance
    final visibleRecommendations = movieRecommendation.take(2 * 8).toList();

    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: visibleRecommendations.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 12.0,
        crossAxisSpacing: 12.0,
        childAspectRatio: 0.8,
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            GoRouter.of(context).push(AppRouter.movieDetailsView,
                extra: visibleRecommendations[index].id);
          },
          child: MovieRecommendationItem(
            recommendation: movieRecommendation[index],
          ),
        );
      },
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';

// import '../../../../core/routing/app_router.dart';
// import '../../domain/entities/recommendation.dart';
// import 'movie_recommendation_item.dart';

// class MovieDetailsRecommendation extends StatelessWidget {
//   const MovieDetailsRecommendation({
//     super.key,
//     required this.movieRecommendation,
//   });
//   final List<Recommendation> movieRecommendation;
//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//       physics: const NeverScrollableScrollPhysics(),
//       shrinkWrap: true,
//       itemCount: movieRecommendation.length,
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         mainAxisSpacing: 12.0,
//         crossAxisSpacing: 12.0,
//         childAspectRatio: 0.8,
//         crossAxisCount: 2,
//       ),
//       itemBuilder: (context, index) {
//         return InkWell(
//           onTap: () {
//             GoRouter.of(context).push(AppRouter.movieDetailsView,
//                 extra: movieRecommendation[index].id);
//           },
//           child: MovieRecommendationItem(
//             recommendation: movieRecommendation[index],
//           ),
//         );
//       },
//     );
//   }
// }
