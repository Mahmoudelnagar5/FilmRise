part of 'favorite_movies_bloc.dart';

sealed class FavoriteMoviesEvent extends Equatable {
  const FavoriteMoviesEvent();

  @override
  List<Object> get props => [];
}

class GetFavoriteMovies extends FavoriteMoviesEvent {}

class ToggleFavoriteMovie extends FavoriteMoviesEvent {
  final MovieDetails movie;

  const ToggleFavoriteMovie(this.movie);

  @override
  List<Object> get props => [movie];
}
