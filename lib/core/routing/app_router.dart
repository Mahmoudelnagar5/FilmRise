import 'package:flimrize/features/movies/domain/usecases/get_casts_use_case.dart';
import 'package:flimrize/features/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:flimrize/features/movies/presentation/controller/favorite_movies_bloc/favorite_movies_bloc.dart';
import 'package:flimrize/features/movies/presentation/controller/trailer_bloc/trailer_bloc.dart';
import 'package:flimrize/features/movies/presentation/controller/movie_details_bloc/movie_details_bloc.dart';
import 'package:flimrize/features/movies/presentation/views/home_view.dart';
import 'package:flimrize/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/movies/domain/usecases/get_favorite_movies_use_case.dart';
import '../../features/movies/domain/usecases/get_movie_datails_usecase.dart';
import '../../features/movies/domain/usecases/get_popular_movies_usecase.dart';
import '../../features/movies/domain/usecases/get_recommendation_movies_usecase.dart';
import '../../features/movies/domain/usecases/get_top_rated_movies_usecase.dart';
import '../../features/movies/domain/usecases/get_trailer_use_case.dart';
import '../../features/movies/presentation/controller/movies_bloc/movies_bloc.dart';
import '../../features/movies/presentation/views/movie_details_view.dart';
import '../../features/movies/presentation/views/search_view.dart';
import '../../features/movies/presentation/views/trailer_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';
import '../utils/service_locator.dart';

class AppRouter {
  static const String splahview = '/';
  static const String homeView = '/homeView';
  static const String movieView = '/movieView';
  static const String onboardingView = '/onboardingView';
  static const String movieDetailsView = '/movieDetailsView';
  static const String searchView = '/searchView';
  static const String trailerView = '/trailerView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: splahview,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: onboardingView,
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: homeView,
        builder: (context, state) => BlocProvider(
          create: (context) => MoviesBloc(
            sl<GetNowPlayingMoviesUsecase>(),
            sl<GetPopularMoviesUsecase>(),
            sl<GetTopRatedMoviesUsecase>(),
          )
            ..add(
              GetNowPlayingMoviesEvent(),
            )
            ..add(
              GetPopularMoviesEvent(),
            )
            ..add(
              GetTopRatedMoviesEvent(),
            ),
          child: const HomeView(),
        ),
      ),
      GoRoute(
        path: movieDetailsView,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => MovieDetailsBloc(
                sl<GetMovieDetailsUseCase>(),
                sl<GetRecommendationMoviesUsecase>(),
                sl<GetCastsUseCase>(),
              )
                ..add(
                  GetMovieDetailsEvent(
                    state.extra as int,
                  ),
                )
                ..add(
                  GetRecommendationMoviesEvent(
                    state.extra as int,
                  ),
                )
                ..add(
                  GetCastsEvent(
                    state.extra as int,
                  ),
                ),
            ),
            BlocProvider(
              create: (context) => FavoriteMoviesBloc(
                sl<GetFavoriteMoviesUseCase>(),
              ),
            ),
          ],
          child: const MovieDetailsView(),
        ),
      ),
      GoRoute(
        path: trailerView,
        builder: (context, state) => BlocProvider(
          create: (context) => TrailerBloc(
            sl<GetTrailerUseCase>(),
          )..add(
              GetTrailerEvent(
                state.extra as int,
              ),
            ),
          child: const TrailerView(),
        ),
      ),
      GoRoute(
        path: searchView,
        builder: (context, state) => const SearchView(),
      ),
    ],
  );
}
