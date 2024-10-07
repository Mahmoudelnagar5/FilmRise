import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flimrize/features/movies/domain/entities/movie_details.dart';
import 'package:flimrize/features/movies/domain/usecases/get_favorite_movies_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../../../../core/utils/constants.dart';

part 'favorite_movies_event.dart';
part 'favorite_movies_state.dart';

class FavoriteMoviesBloc
    extends Bloc<FavoriteMoviesEvent, FavoriteMoviesState> {
  final GetFavoriteMoviesUseCase getFavoriteMoviesUseCase;

  FavoriteMoviesBloc(this.getFavoriteMoviesUseCase)
      : super(FavoriteMoviesInitial()) {
    on<ToggleFavoriteMovie>(_onToggleFavoriteMovie);
    on<GetFavoriteMovies>(_onGetFavoriteMovies);
  }

  FutureOr<void> _onGetFavoriteMovies(
      GetFavoriteMovies event, Emitter<FavoriteMoviesState> emit) async {
    final List<MovieDetails> favoriteMovies = await getFavoriteMovies();
    emit(FavoriteMoviesLoaded(favoriteMovies));
  }

  Future<List<MovieDetails>> getFavoriteMovies() async {
    final moviesBox = Hive.box<MovieDetails>(kMoviesBox);
    return moviesBox.values.toList();
  }

  FutureOr<void> _onToggleFavoriteMovie(
      ToggleFavoriteMovie event, Emitter<FavoriteMoviesState> emit) async {
    final movie = event.movie;
    final moviesBox = Hive.box<MovieDetails>(kMoviesBox);
    final List<MovieDetails> movies = moviesBox.values.toList();

    final int movieIndex =
        movies.indexWhere((element) => element.id == movie.id);

    if (movieIndex == -1) {
      await moviesBox.add(movie); // Add movie if it's not in the list
    } else {
      await moviesBox
          .deleteAt(movieIndex); // Remove movie if it's already in the list
    }

    // Update the favorite movie list after toggling
    final updatedFavorites = await getFavoriteMovies();
    emit(FavoriteMoviesLoaded(updatedFavorites));
  }

  bool isFavoriteMovie(MovieDetails movie) {
    final moviesBox = Hive.box<MovieDetails>(kMoviesBox);
    final List<MovieDetails> movies = moviesBox.values.toList();
    return movies.any((element) => element.id == movie.id);
  }
}

// import 'dart:async';

// import 'package:equatable/equatable.dart';
// import 'package:flimrize/features/movies/domain/entities/movie_details.dart';
// import 'package:flimrize/features/movies/domain/usecases/get_favorite_movies_use_case.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:hive_flutter/hive_flutter.dart';

// import '../../../../../core/utils/constants.dart';

// part 'favorite_movies_event.dart';
// part 'favorite_movies_state.dart';

// class FavoriteMoviesBloc
//     extends Bloc<FavoriteMoviesEvent, FavoriteMoviesState> {
//   final GetFavoriteMoviesUseCase getFavoriteMoviesUseCase;

//   FavoriteMoviesBloc(this.getFavoriteMoviesUseCase)
//       : super(FavoriteMoviesInitial()) {
//     on<ToggleFavoriteMovie>(_toggleFavoriteMovie);
//     on<GetFavoriteMovies>(_getFavoriteMovies);
//   }

//   FutureOr<void> _getFavoriteMovies(
//       GetFavoriteMovies event, Emitter<FavoriteMoviesState> emit) {
//     final result = getFavoriteMoviesUseCase();
//     emit(FavoriteMoviesLoaded(result));
//   }

//   bool isFavoriteMovie(MovieDetails movie) {
//     final moviesBox = Hive.box<MovieDetails>(kMoviesBox);
//     List<MovieDetails> movies = moviesBox.values.toList();
//     print('fav: $movies');
//     final index = movies.indexWhere((element) => element.id == movie.id);
//     return index != -1;
//   }

//   FutureOr<void> _toggleFavoriteMovie(
//       ToggleFavoriteMovie event, Emitter<FavoriteMoviesState> emit) async {
//     final movie = event.movie;
//     final moviesBox = Hive.box<MovieDetails>(kMoviesBox);
//     List<MovieDetails> movies = moviesBox.values.toList();
//     final index = movies.indexWhere((element) => element.id == movie.id);
//     if (index == -1) {
//       moviesBox.add(movie);
//     } else {
//       moviesBox.deleteAt(index);
//     }
//     print(movies);
//     // emit(FavoriteMoviesLoaded(movies));
//     _getFavoriteMovies(GetFavoriteMovies(), emit);
//   }
// }
