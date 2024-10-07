import '../../domain/entities/movie_details.dart';
import 'genre_model.dart';

class MovieDetailsModel extends MovieDetails {
  MovieDetailsModel({
    required super.backdropPath,
    required super.genres,
    required super.id,
    required super.overview,
    required super.posterPath,
    required super.releaseDate,
    required super.runtime,
    required super.status,
    required super.title,
    required super.voteAverage,
    required super.voteCount,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailsModel(
      backdropPath: json['backdrop_path'],
      genres:
          (json['genres'] as List).map((e) => GenreModel.fromJson(e)).toList(),
      id: json['id'],
      overview: json['overview'],
      posterPath: json['poster_path'],
      releaseDate: json['release_date'],
      runtime: json['runtime'],
      status: json['status'],
      title: json['title'],
      voteAverage: json['vote_average'],
      voteCount: json['vote_count'],
    );
  }
}
