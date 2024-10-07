import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../../core/utils/enums/movies_status.dart';

import '../../../../core/widgets/custom_error_widget.dart';
import '../controller/movie_details_bloc/movie_details_bloc.dart';
import '../widgets/movie_details_footer_buttons.dart';
import '../widgets/movie_details_view_body.dart';

class MovieDetailsView extends StatelessWidget {
  const MovieDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
      builder: (context, state) {
        // print(state.movieDetails?.id);
        if (state.movieDetailsState == MoviesStatus.loading) {
          return const Scaffold(
            body: Center(
              child: SpinKitWaveSpinner(
                color: Colors.white,
                size: 80,
              ),
            ),
          );
        }
        if (state.movieDetailsState == MoviesStatus.error) {
          return Scaffold(
            body: CustomErrorWidget(error: state.movieDetailsErrorMessage),
          );
        }
        if (state.movieDetailsState == MoviesStatus.loaded &&
            state.movieDetails?.id != null) {
          return Scaffold(
            body: MovieDetailsViewBody(
              movieDetail: state.movieDetails!,
              movieRecommendation: state.movieRecommendation,
              casts: state.casts,
            ),
            persistentFooterButtons: [
              MovieDetailsFooterButtons(
                movie: state.movieDetails!,
              ),
            ],
          );
        }
        return Container();
      },
    );
  }
}
