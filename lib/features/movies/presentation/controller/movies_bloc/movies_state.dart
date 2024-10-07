part of 'movies_bloc.dart';

class MoviesState extends Equatable {
  const MoviesState({
    this.nowPlayingMovies = const [],
    this.popularMovies = const [],
    this.topRatedMovies = const [],
    this.nowPlayingState = MoviesStatus.loading,
    this.popularMoviesState = MoviesStatus.loading,
    this.topRatedMoviesState = MoviesStatus.loading,
    this.nowPlayingErrorMessage = '',
    this.popularMoviesErrorMessage = '',
    this.topRatedMoviesErrorMessage = '',
  });
  final List<Movie> nowPlayingMovies;
  final List<Movie> popularMovies;
  final List<Movie> topRatedMovies;
  final MoviesStatus nowPlayingState;
  final MoviesStatus popularMoviesState;
  final MoviesStatus topRatedMoviesState;
  final String nowPlayingErrorMessage;
  final String popularMoviesErrorMessage;
  final String topRatedMoviesErrorMessage;

  MoviesState copyWith({
    List<Movie>? nowPlayingMovies,
    List<Movie>? popularMovies,
    List<Movie>? topRatedMovies,
    MoviesStatus? nowPlayingState,
    MoviesStatus? popularMoviesState,
    MoviesStatus? topRatedMoviesState,
    String? nowPlayingMessage,
    String? popularMoviesMessage,
    String? topRatedMoviesMessage,
  }) {
    return MoviesState(
      nowPlayingMovies: nowPlayingMovies ??= this.nowPlayingMovies,
      popularMovies: popularMovies ??= this.popularMovies,
      topRatedMovies: topRatedMovies ??= this.topRatedMovies,
      nowPlayingState: nowPlayingState ??= this.nowPlayingState,
      popularMoviesState: popularMoviesState ??= this.popularMoviesState,
      topRatedMoviesState: topRatedMoviesState ??= this.topRatedMoviesState,
      nowPlayingErrorMessage: nowPlayingMessage ??= nowPlayingErrorMessage,
      popularMoviesErrorMessage: popularMoviesMessage ??=
          this.popularMoviesErrorMessage,
      topRatedMoviesErrorMessage: topRatedMoviesMessage ??=
          this.topRatedMoviesErrorMessage,
    );
  }

  @override
  List<Object> get props => [
        nowPlayingMovies,
        popularMovies,
        topRatedMovies,
        nowPlayingErrorMessage,
        popularMoviesErrorMessage,
        topRatedMoviesErrorMessage,
        nowPlayingState,
        popularMoviesState,
        topRatedMoviesState
      ];
}
