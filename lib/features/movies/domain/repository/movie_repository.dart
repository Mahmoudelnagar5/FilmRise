import 'package:dartz/dartz.dart';
import 'package:flimrize/core/errors/failures.dart';
import 'package:flimrize/features/movies/domain/entities/trailer.dart';

import '../entities/cast.dart';
import '../entities/movie.dart';
import '../entities/movie_details.dart';
import '../entities/recommendation.dart';

abstract class MovieRepository {
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies();
  Future<Either<Failure, List<Movie>>> getPopularMovies();
  Future<Either<Failure, List<Movie>>> getTopRatedMovies();
  Future<Either<Failure, MovieDetails>> getMovieDetails(int movieId);
  Future<Either<Failure, List<Recommendation>>> getRecommendationMovies(
      int movieId);
  Future<Either<Failure, List<Cast>>> getCasts(int movieId);
  Future<Either<Failure, Trailer>> getTrailer(int movieId);
  Future<Either<Failure, List<Movie>>> getSearchMovies(String query);
  List<MovieDetails> getFavoriteMovies();
}
