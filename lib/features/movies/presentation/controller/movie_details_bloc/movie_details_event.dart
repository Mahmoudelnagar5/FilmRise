part of 'movie_details_bloc.dart';

sealed class MovieDetailsEvent extends Equatable {
  const MovieDetailsEvent();

  @override
  List<Object> get props => [];
}

class GetMovieDetailsEvent extends MovieDetailsEvent {
  final int movieId;

  const GetMovieDetailsEvent(this.movieId);

  @override
  List<Object> get props => [movieId];
}

class GetCastsEvent extends MovieDetailsEvent {
  final int movieId;

  const GetCastsEvent(this.movieId);

  @override
  List<Object> get props => [movieId];
}

class GetRecommendationMoviesEvent extends MovieDetailsEvent {
  final int movieId;

  const GetRecommendationMoviesEvent(this.movieId);

  @override
  List<Object> get props => [movieId];
}
