import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final String? backdropPath; // imageUrl
  final List<int> genreIds;
  final int id;
  final String overview;

  final String? posterPath;

  final String releaseDate;

  final String title;

  final double voteAverage;

  final int voteCount;

  const Movie({
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.voteAverage,
    required this.voteCount,
  });

  @override
  List<Object?> get props => [
        backdropPath,
        genreIds,
        id,
        overview,
        posterPath,
        releaseDate,
        title,
        voteAverage,
        voteCount
      ];
}
