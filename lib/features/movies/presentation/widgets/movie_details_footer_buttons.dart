import 'package:animate_do/animate_do.dart';
import 'package:flimrize/features/movies/domain/entities/movie_details.dart';
import 'package:flimrize/features/movies/presentation/controller/favorite_movies_bloc/favorite_movies_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routing/app_router.dart';
import 'custom_container_button.dart';

class MovieDetailsFooterButtons extends StatelessWidget {
  const MovieDetailsFooterButtons({
    super.key,
    required this.movie,
  });
  final MovieDetails movie;

  @override
  Widget build(BuildContext context) {
    return ElasticInLeft(
      duration: const Duration(milliseconds: 2000),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: CustomContainerButton(
              onPressed: () {
                GoRouter.of(context).push(
                  AppRouter.trailerView,
                  extra: movie.id,
                );
              },
              color: Colors.redAccent,
              icon: Icons.play_circle_fill_rounded,
              text: 'Watch Trailers',
            ),
          ),
          Expanded(
            child: BlocBuilder<FavoriteMoviesBloc, FavoriteMoviesState>(
              builder: (context, state) {
                bool isFavorite = BlocProvider.of<FavoriteMoviesBloc>(context)
                    .isFavoriteMovie(movie);
                return CustomContainerButton(
                  onPressed: () {
                    BlocProvider.of<FavoriteMoviesBloc>(context)
                        .add(ToggleFavoriteMovie(movie));
                    print(state);
                  },
                  color: const Color.fromARGB(255, 245, 156, 13),
                  icon: isFavorite ? Icons.delete : Icons.list_alt_outlined,
                  text: isFavorite ? 'Delete from List' : 'Add To List',
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

// import 'package:animate_do/animate_do.dart';
// import 'package:flimrize/features/movies/presentation/controller/favorite_movies_bloc/favorite_movies_bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';

// import '../../../../core/routing/app_router.dart';
// import 'custom_container_button.dart';

// class MovieDetailsFooterButtons extends StatelessWidget {
//   const MovieDetailsFooterButtons({
//     super.key,
//     required this.movie,
//   });
//   final dynamic movie;
//   @override
//   Widget build(BuildContext context) {
//     return ElasticInLeft(
//       duration: const Duration(milliseconds: 2000),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Expanded(
//             child: CustomContainerButton(
//               onPressed: () {
//                 GoRouter.of(context).push(
//                   AppRouter.trailerView,
//                   extra: movie!.id,
//                 );
//               },
//               color: Colors.redAccent,
//               icon: Icons.play_circle_fill_rounded,
//               text: 'Watch Trailers',
//             ),
//           ),
//           Expanded(
//             child: CustomContainerButton(
//               onPressed: () {
//                 BlocProvider.of<FavoriteMoviesBloc>(context)
//                     .add(ToggleFavoriteMovie(movie));
//               },
//               color: const Color.fromARGB(255, 245, 156, 13),
//               icon: Icons.list_alt_outlined,
//               text: BlocProvider.of<FavoriteMoviesBloc>(context)
//                       .isFavoriteMovie(movie)
//                   ? 'Delete from List'
//                   : 'Add To Lists',
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
