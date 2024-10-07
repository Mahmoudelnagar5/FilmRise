import '../../domain/entities/movie.dart';

class MovieModel extends Movie {
  MovieModel({
    required super.backdropPath,
    required super.genreIds,
    required super.id,
    required super.overview,
    required super.posterPath,
    required super.releaseDate,
    required super.title,
    required super.voteAverage,
    required super.voteCount,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        backdropPath: json['backdrop_path'],
        genreIds: List<int>.from(json['genre_ids'].map((e) => e)),
        id: json['id'],
        overview: json['overview'],
        posterPath: json['poster_path'],
        releaseDate: json['release_date'] ?? json['first_air_date'],
        title: json['title'],
        voteAverage: json['vote_average'].toDouble(),
        voteCount: json['vote_count'],
      );

  Map<String, dynamic> toJson() => {
        'backdrop_path': backdropPath,
        'genre_ids': List<dynamic>.from(genreIds.map((e) => e)),
        'id': id,
        'overview': overview,
        'poster_path': posterPath,
        'release_date': releaseDate,
        'title': title,
        'vote_average': voteAverage,
        'vote_count': voteCount,
      };
}
