import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/enums/movies_status.dart';
import '../../../domain/entities/cast.dart';
import '../../../domain/entities/movie_details.dart';
import '../../../domain/entities/recommendation.dart';
import '../../../domain/usecases/get_casts_use_case.dart';
import '../../../domain/usecases/get_movie_datails_usecase.dart';
import '../../../domain/usecases/get_recommendation_movies_usecase.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetCastsUseCase getCastsUseCase;
  final GetRecommendationMoviesUsecase getRecommendationMoviesUseCase;
  MovieDetailsBloc(
    this.getMovieDetailsUseCase,
    this.getRecommendationMoviesUseCase,
    this.getCastsUseCase,
  ) : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetRecommendationMoviesEvent>(_getRecommendationMovies);
    on<GetCastsEvent>(_getCasts);
  }

  FutureOr<void> _getMovieDetails(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    final result = await getMovieDetailsUseCase(event.movieId);
    result.fold(
      (failure) => emit(
        state.copyWith(
          movieDetailsErrorMessage: failure.errMessage,
          movieDetailsState: MoviesStatus.error,
        ),
      ),
      (movieDetails) => emit(
        state.copyWith(
          movieDetails: movieDetails,
          movieDetailsState: MoviesStatus.loaded,
        ),
      ),
    );
  }

  FutureOr<void> _getRecommendationMovies(GetRecommendationMoviesEvent event,
      Emitter<MovieDetailsState> emit) async {
    final result = await getRecommendationMoviesUseCase(event.movieId);
    result.fold(
      (failure) => emit(
        state.copyWith(
          movieRecommendationErrorMessage: failure.errMessage,
          movieRecommendationState: MoviesStatus.error,
        ),
      ),
      (recommendations) => emit(
        state.copyWith(
          movieRecommendation: recommendations,
          movieDetailsState: MoviesStatus.loaded,
        ),
      ),
    );
  }

  FutureOr<void> _getCasts(
      GetCastsEvent event, Emitter<MovieDetailsState> emit) async {
    final result = await getCastsUseCase(event.movieId);
    result.fold(
      (failure) => emit(
        state.copyWith(
          castsErrorMessage: failure.errMessage,
          castsState: MoviesStatus.error,
        ),
      ),
      (casts) => emit(
        state.copyWith(
          casts: casts,
          castsState: MoviesStatus.loaded,
        ),
      ),
    );
  }
}
