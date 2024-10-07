// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

import 'genre.dart';

part 'movie_details.g.dart';

@HiveType(typeId: 0)
class MovieDetails extends HiveObject with EquatableMixin {
  @HiveField(0)
  final String backdropPath;
  final List<Genre> genres;
  @HiveField(1)
  final int id;
  @HiveField(2)
  final String overview;
  @HiveField(3)
  final String posterPath;
  @HiveField(4)
  final String releaseDate;
  @HiveField(5)
  final int runtime;
  @HiveField(6)
  final String status;
  @HiveField(7)
  final String title;
  @HiveField(8)
  final double voteAverage;
  @HiveField(9)
  final int voteCount;

  MovieDetails({
    required this.backdropPath,
    required this.genres,
    required this.id,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.runtime,
    required this.status,
    required this.title,
    required this.voteAverage,
    required this.voteCount,
  });

  @override
  List<Object> get props {
    return [
      backdropPath,
      genres,
      id,
      overview,
      posterPath,
      releaseDate,
      runtime,
      status,
      title,
      voteAverage,
      voteCount,
    ];
  }
}
