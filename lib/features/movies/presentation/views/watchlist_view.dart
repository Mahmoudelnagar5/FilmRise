import 'package:flimrize/features/movies/presentation/controller/favorite_movies_bloc/favorite_movies_bloc.dart';
import 'package:flimrize/features/movies/presentation/widgets/show_movie_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helper/show_snack_bar.dart';
import '../../../../core/utils/app_styles.dart';

class WatchlistView extends StatelessWidget {
  const WatchlistView({super.key});

  @override
  Widget build(BuildContext context) {
    // Trigger the GetFavoriteMovies event when the widget is built
    BlocProvider.of<FavoriteMoviesBloc>(context).add(GetFavoriteMovies());

    return BlocBuilder<FavoriteMoviesBloc, FavoriteMoviesState>(
      builder: (context, state) {
        if (state is FavoriteMoviesInitial) {
          return Center(
            child: Text(
              'Add movies to your watchlist',
              style: AppStyles.styleMedium16.copyWith(
                fontStyle: FontStyle.italic,
              ),
            ),
          );
        }

        if (state is FavoriteMoviesLoaded) {
          if (state.favoriteMovies.isEmpty) {
            return Center(
              child: Text(
                'Add movies to your watchlist',
                style: AppStyles.styleMedium16.copyWith(
                  fontStyle: FontStyle.italic,
                ),
              ),
            );
          }

          return ListView.builder(
            itemCount: state.favoriteMovies.length,
            itemBuilder: (context, index) {
              final movie = state.favoriteMovies[index];
              return Dismissible(
                key: Key(movie.id.toString()), // Unique key for each item
                direction: DismissDirection.endToStart,
                onDismissed: (direction) {
                  // Dispatch the event to remove the movie from favorites
                  BlocProvider.of<FavoriteMoviesBloc>(context).add(
                    ToggleFavoriteMovie(movie),
                  );
                  showSnackBar(
                    context,
                    'movie removed from watchlist',
                  );
                },
                background: Container(
                  color: Colors.red,
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: const Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: ShowMoviesItem(
                    movie: movie,
                  ),
                ),
              );
            },
          );
        }

        // Fallback in case of an unknown state
        return Center(
          child: Text(
            'Add movies to your watchlist',
            style: AppStyles.styleMedium16.copyWith(
              fontStyle: FontStyle.italic,
            ),
          ),
        );
      },
    );
  }
}
