import 'package:dartz/dartz.dart';
import 'package:flimrize/features/movies/domain/entities/cast.dart';
import 'package:flimrize/features/movies/domain/entities/movie_details.dart';
import 'package:flimrize/features/movies/domain/entities/recommendation.dart';
import 'package:flimrize/features/movies/domain/entities/trailer.dart';

import '../../../../core/errors/failures.dart';
import '../../domain/entities/movie.dart';
import '../../domain/repository/movie_repository.dart';
import '../datasource/movie_local_data_source.dart';
import '../datasource/movie_remote_data_source.dart';

class MovieRepositoryImpl implements MovieRepository {
  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;
  final BaseMovieLocalDataSource baseMovieLocalDataSource;

  MovieRepositoryImpl(
      this.baseMovieRemoteDataSource, this.baseMovieLocalDataSource);

  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies() {
    final result = baseMovieRemoteDataSource.getNowPlayingMovies();
    return result;
  }

  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails(int movieId) {
    final result = baseMovieRemoteDataSource.getMovieDetails(movieId);
    return result;
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() {
    final result = baseMovieRemoteDataSource.getPopularMovies();
    return result;
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() {
    final result = baseMovieRemoteDataSource.getTopRatedMovies();
    return result;
  }

  @override
  Future<Either<Failure, List<Recommendation>>> getRecommendationMovies(
      int movieId) {
    final result = baseMovieRemoteDataSource.getRecommendationMovies(movieId);
    return result;
  }

  @override
  Future<Either<Failure, List<Cast>>> getCasts(int movieId) {
    final result = baseMovieRemoteDataSource.getCasts(movieId);
    return result;
  }

  @override
  Future<Either<Failure, Trailer>> getTrailer(int movieId) {
    final result = baseMovieRemoteDataSource.getTrailer(movieId);
    return result;
  }

  @override
  Future<Either<Failure, List<Movie>>> getSearchMovies(String query) {
    final result = baseMovieRemoteDataSource.getSearchMovies(query);
    return result;
  }

  @override
  List<MovieDetails> getFavoriteMovies() {
    final result = baseMovieLocalDataSource.getFavoriteMovies();
    return result;
  }
}
