import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flimrize/features/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:flimrize/features/movies/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/enums/movies_status.dart';
import '../../../domain/entities/movie.dart';
import '../../../domain/usecases/get_popular_movies_usecase.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUsecase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUsecase getPopularMoviesUsecase;
  final GetTopRatedMoviesUsecase getTopRatedMoviesUsecase;
  List<Movie> nowPlayingMovies = [];
  List<Movie> popularMovies = [];
  List<Movie> topRatedMovies = [];
  MoviesBloc(
    this.getNowPlayingMoviesUseCase,
    this.getPopularMoviesUsecase,
    this.getTopRatedMoviesUsecase,
  ) : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);
    on<GetPopularMoviesEvent>(_getPopularMovies);
    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);
  }

  FutureOr<void> _getNowPlayingMovies(
      GetNowPlayingMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getNowPlayingMoviesUseCase();
    result.fold(
      (failure) => emit(
        state.copyWith(
          nowPlayingState: MoviesStatus.error,
          nowPlayingMessage: failure.errMessage,
        ),
      ),
      (movies) {
        emit(
          state.copyWith(
            nowPlayingMovies: movies,
            nowPlayingState: MoviesStatus.loaded,
          ),
        );
        nowPlayingMovies = movies;
      },
    );
  }

  FutureOr<void> _getPopularMovies(
      GetPopularMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getPopularMoviesUsecase();
    result.fold(
      (failure) => emit(
        state.copyWith(
          popularMoviesState: MoviesStatus.error,
          popularMoviesMessage: failure.errMessage,
        ),
      ),
      (movies) {
        emit(
          state.copyWith(
            popularMovies: movies,
            popularMoviesState: MoviesStatus.loaded,
          ),
        );
        popularMovies = movies;
      },
    );
  }

  FutureOr<void> _getTopRatedMovies(
      GetTopRatedMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getTopRatedMoviesUsecase();
    result.fold(
      (failure) => emit(
        state.copyWith(
          topRatedMoviesState: MoviesStatus.error,
          topRatedMoviesMessage: failure.errMessage,
        ),
      ),
      (movies) {
        emit(
          state.copyWith(
            topRatedMovies: movies,
            topRatedMoviesState: MoviesStatus.loaded,
          ),
        );
        topRatedMovies = movies;
      },
    );
  }
}
