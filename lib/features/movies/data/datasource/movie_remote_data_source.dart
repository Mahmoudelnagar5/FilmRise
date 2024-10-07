import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:flimrize/features/movies/data/models/cast_model.dart';
import 'package:flimrize/features/movies/data/models/trailer_model.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/utils/api_constants.dart';
import '../models/movie_details_model.dart';
import '../models/movie_model.dart';
import '../models/recommendation_model.dart';

abstract class BaseMovieRemoteDataSource {
  Future<Either<Failure, List<MovieModel>>> getNowPlayingMovies();
  Future<Either<Failure, List<MovieModel>>> getPopularMovies();
  Future<Either<Failure, List<MovieModel>>> getTopRatedMovies();
  Future<Either<Failure, List<CastModel>>> getCasts(int movieId);

  Future<Either<Failure, List<RecommendationModel>>> getRecommendationMovies(
      int movieId);

  Future<Either<Failure, MovieDetailsModel>> getMovieDetails(int movieId);
  Future<Either<Failure, TrailerModel>> getTrailer(int movieId);
  Future<Either<Failure, List<MovieModel>>> getSearchMovies(String query);
}

class MovieRemoteDataSource implements BaseMovieRemoteDataSource {
  final Dio dio;

  MovieRemoteDataSource(this.dio);
  @override
  Future<Either<Failure, List<MovieModel>>> getNowPlayingMovies() async {
    try {
      final response = await dio.get(ApiConstants.getNowPlayingMoviesPath);
      List<MovieModel> movies = [];

      List<dynamic> results = response.data['results'];

      movies = results
          .map(
            (e) => MovieModel.fromJson(e),
          )
          .toList();

      return Right(movies);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, MovieDetailsModel>> getMovieDetails(
      int movieId) async {
    try {
      var response = await dio.get(ApiConstants.getMovieDetailsPath(movieId));
      return Right(MovieDetailsModel.fromJson(response.data));
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MovieModel>>> getPopularMovies() async {
    try {
      final response = await dio.get(ApiConstants.getPopularMoviesPath);
      List<MovieModel> movies = [];

      List<dynamic> results = response.data['results'];

      movies = results
          .map(
            (e) => MovieModel.fromJson(e),
          )
          .toList();

      return Right(movies);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MovieModel>>> getTopRatedMovies() async {
    try {
      final response = await dio.get(ApiConstants.getTopRatedMoviesPath);
      List<MovieModel> movies = [];

      List<dynamic> results = response.data['results'];

      movies = results
          .map(
            (e) => MovieModel.fromJson(e),
          )
          .toList();

      return Right(movies);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<RecommendationModel>>> getRecommendationMovies(
      int movieId) async {
    try {
      final response =
          await dio.get(ApiConstants.getRecommendationPath(movieId));
      // print(response.data);
      List<dynamic> json = response.data['results'];
      List<RecommendationModel> recommendationMovies = List.generate(
        json.length,
        (index) => RecommendationModel.fromJson(
          json[index],
        ),
      );

      return right(recommendationMovies);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CastModel>>> getCasts(int movieId) async {
    try {
      final response = await dio.get(ApiConstants.getCastPath(movieId));
      List<CastModel> casts = [];
      List<dynamic> json = response.data['cast'];
      casts = List.generate(
        json.length,
        (index) => CastModel.fromJson(
          json[index],
        ),
      );

      return right(casts);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, TrailerModel>> getTrailer(int movieId) async {
    try {
      final response = await dio.get(ApiConstants.getTrailerPath(movieId));

      return right(
        TrailerModel.fromJson(
          response.data['results'][0],
        ),
      );
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MovieModel>>> getSearchMovies(
      String query) async {
    try {
      final response = await dio.get(ApiConstants.getSearchPath(query));

      List<MovieModel> movies = [];

      List<dynamic> results = response.data['results'];
      movies = results
          .map(
            (e) => MovieModel.fromJson(e),
          )
          .toList();

      return Right(movies);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
