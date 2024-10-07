import 'package:flimrize/core/utils/enums/movies_status.dart';
import 'package:flimrize/core/widgets/custom_error_widget.dart';
import 'package:flimrize/features/movies/presentation/controller/movies_bloc/movies_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'movies_loading.dart';
import 'popular_movies_loaded.dart';

class PopularMoveisListView extends StatelessWidget {
  const PopularMoveisListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      builder: (context, state) {
        final movies = state.popularMovies;
        switch (state.popularMoviesState) {
          case MoviesStatus.loading:
            return const MoviesLoading();
          case MoviesStatus.error:
            return CustomErrorWidget(error: state.popularMoviesErrorMessage);
          case MoviesStatus.loaded:
            return PopularMoviesLoaded(movies: movies);
        }
      },
    );
  }
}
