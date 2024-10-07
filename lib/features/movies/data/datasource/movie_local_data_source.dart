import 'package:hive_flutter/hive_flutter.dart';

import '../../../../core/utils/constants.dart';
import '../../domain/entities/movie_details.dart';

abstract class BaseMovieLocalDataSource {
  List<MovieDetails> getFavoriteMovies();
}

class MovieLocalDataSource implements BaseMovieLocalDataSource {
  @override
  List<MovieDetails> getFavoriteMovies() {
    final favoriteMoviesBox = Hive.box<MovieDetails>(kMoviesBox);
    final favoriteMovies = favoriteMoviesBox.values.toList();
    return favoriteMovies;
  }
}
