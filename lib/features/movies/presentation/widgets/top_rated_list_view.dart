import 'package:flimrize/core/widgets/custom_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/enums/movies_status.dart';
import '../controller/movies_bloc/movies_bloc.dart';
import 'movies_loading.dart';
import 'top_rated_movies_loaded.dart';

class TopRatedListView extends StatelessWidget {
  const TopRatedListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      builder: (context, state) {
        final movies = state.topRatedMovies;
        switch (state.popularMoviesState) {
          case MoviesStatus.loading:
            return const MoviesLoading();
          case MoviesStatus.error:
            return CustomErrorWidget(error: state.popularMoviesErrorMessage);
          case MoviesStatus.loaded:
            return TopRatedMoviesLoaded(movies: movies);
        }
      },
    );
  }
}
