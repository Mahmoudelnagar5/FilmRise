part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
  final MovieDetails? movieDetails;
  final MoviesStatus movieDetailsState;
  final List<Recommendation> movieRecommendation;
  final MoviesStatus movieRecommendationState;
  final String movieDetailsErrorMessage;
  final String movieRecommendationErrorMessage;
  final List<Cast> casts;
  final MoviesStatus castsState;
  final String castsErrorMessage;
  const MovieDetailsState({
    this.movieDetails,
    this.movieRecommendation = const [],
    this.casts = const [],
    this.movieDetailsState = MoviesStatus.loading,
    this.movieRecommendationState = MoviesStatus.loading,
    this.castsState = MoviesStatus.loading,
    this.castsErrorMessage = '',
    this.movieDetailsErrorMessage = '',
    this.movieRecommendationErrorMessage = '',
  });

  MovieDetailsState copyWith({
    MovieDetails? movieDetails,
    MoviesStatus? movieDetailsState,
    List<Recommendation>? movieRecommendation,
    MoviesStatus? movieRecommendationState,
    String? movieDetailsErrorMessage,
    String? movieRecommendationErrorMessage,
    List<Cast>? casts,
    MoviesStatus? castsState,
    String? castsErrorMessage,
  }) {
    return MovieDetailsState(
      movieDetails: movieDetails ?? this.movieDetails,
      movieDetailsState: movieDetailsState ?? this.movieDetailsState,
      movieRecommendation: movieRecommendation ?? this.movieRecommendation,
      movieRecommendationState:
          movieRecommendationState ?? this.movieRecommendationState,
      movieDetailsErrorMessage:
          movieDetailsErrorMessage ?? this.movieDetailsErrorMessage,
      movieRecommendationErrorMessage: movieRecommendationErrorMessage ??
          this.movieRecommendationErrorMessage,
      casts: casts ?? this.casts,
      castsState: castsState ?? this.castsState,
      castsErrorMessage: castsErrorMessage ?? this.castsErrorMessage,
    );
  }

  @override
  List<Object?> get props => [
        movieDetails,
        movieDetailsState,
        movieRecommendation,
        movieRecommendationState,
        movieDetailsErrorMessage,
        movieRecommendationErrorMessage,
        casts,
        castsState,
        castsErrorMessage,
      ];
}
