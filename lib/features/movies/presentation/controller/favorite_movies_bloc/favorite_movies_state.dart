part of 'favorite_movies_bloc.dart';

sealed class FavoriteMoviesState extends Equatable {
  const FavoriteMoviesState();

  @override
  List<Object> get props => [];
}

final class FavoriteMoviesInitial extends FavoriteMoviesState {}

class FavoriteMoviesLoaded extends FavoriteMoviesState {
  final List<MovieDetails> favoriteMovies;

  const FavoriteMoviesLoaded(this.favoriteMovies);

  @override
  List<Object> get props => [favoriteMovies];
}
