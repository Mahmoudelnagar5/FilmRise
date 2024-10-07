import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../../core/utils/enums/movies_status.dart';
import '../../../../core/widgets/custom_error_widget.dart';
import '../controller/movies_bloc/movies_bloc.dart';
import 'show_movies_loaded.dart';

class ShowMoviesListView extends StatelessWidget {
  const ShowMoviesListView({
    super.key,
    required this.isSelected,
  });
  final int isSelected; // 1 for Popular, 2 for Top Rated

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      builder: (context, state) {
        final popularMovies = state.popularMovies;
        final topRatedMovies = state.topRatedMovies;
        switch (state.popularMoviesState) {
          case MoviesStatus.loading:
            return const SliverFillRemaining(
              child: Center(
                child: SpinKitWaveSpinner(
                  color: Colors.white,
                  size: 80,
                ),
              ),
            );
          case MoviesStatus.error:
            return SliverFillRemaining(
                child:
                    CustomErrorWidget(error: state.popularMoviesErrorMessage));
          case MoviesStatus.loaded:
            return ShowMoviesLoaded(
              movies: isSelected == 1 ? popularMovies : topRatedMovies,
            );
        }
      },
    );
  }
}
