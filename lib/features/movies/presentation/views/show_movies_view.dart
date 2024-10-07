import 'package:flimrize/features/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/service_locator.dart';

import '../../domain/usecases/get_popular_movies_usecase.dart';
import '../../domain/usecases/get_top_rated_movies_usecase.dart';
import '../controller/movies_bloc/movies_bloc.dart';
import '../widgets/show_movies_list_view.dart';
import '../widgets/show_movies_sliver_app_bar.dart';

class ShowMoviesView extends StatelessWidget {
  const ShowMoviesView({
    super.key,
    required this.title,
    required this.isSelected,
  });
  final String title;
  final int isSelected;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MoviesBloc(
        sl<GetNowPlayingMoviesUsecase>(),
        sl<GetPopularMoviesUsecase>(),
        sl<GetTopRatedMoviesUsecase>(),
      )
        ..add(
          GetPopularMoviesEvent(),
        )
        ..add(
          GetTopRatedMoviesEvent(),
        ),
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            ShowMoviesSliverAppBar(title: title),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),
            ShowMoviesListView(
              isSelected: isSelected,
            ),
          ],
        ),
      ),
    );
  }
}
