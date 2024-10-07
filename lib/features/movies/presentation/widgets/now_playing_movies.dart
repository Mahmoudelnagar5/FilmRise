import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/enums/movies_status.dart';
import '../../../../core/widgets/custom_error_widget.dart';
import '../controller/movies_bloc/movies_bloc.dart';
import 'now_playing_movies_items.dart';
import 'now_playing_movies_loading.dart';

class NowPlayingMovies extends StatelessWidget {
  const NowPlayingMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      builder: (context, state) {
        final movies = state.nowPlayingMovies;
        switch (state.nowPlayingState) {
          case MoviesStatus.loading:
            return const NowPlayingMoviesLoading();
          case MoviesStatus.error:
            return CustomErrorWidget(
              error: state.nowPlayingErrorMessage,
            );
          case MoviesStatus.loaded:
            if (movies.isNotEmpty) {
              return NowPlayingMoviesItems(movies: movies);
            }
            break;
        }
        return Center(
          child: Text(
            "No movies available",
            style: AppStyles.styleMedium16,
          ),
        );
      },
    );
  }
}
