import 'package:dio/dio.dart';
import 'package:flimrize/features/movies/data/repository/movie_repository_impl.dart';
import 'package:flimrize/features/movies/domain/usecases/get_casts_use_case.dart';
import 'package:flimrize/features/movies/domain/usecases/get_favorite_movies_use_case.dart';
import 'package:flimrize/features/movies/domain/usecases/get_recommendation_movies_usecase.dart';
import 'package:get_it/get_it.dart';

import '../../features/movies/data/datasource/movie_local_data_source.dart';
import '../../features/movies/data/datasource/movie_remote_data_source.dart';
import '../../features/movies/domain/repository/movie_repository.dart';
import '../../features/movies/domain/usecases/get_movie_datails_usecase.dart';
import '../../features/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import '../../features/movies/domain/usecases/get_popular_movies_usecase.dart';
import '../../features/movies/domain/usecases/get_search_movies_use_case.dart';
import '../../features/movies/domain/usecases/get_top_rated_movies_usecase.dart';
import '../../features/movies/domain/usecases/get_trailer_use_case.dart';

GetIt sl = GetIt.instance;
void setupServiceLocator() {
  sl.registerLazySingleton<Dio>(
    () => Dio(),
  );
  sl.registerLazySingleton<BaseMovieRemoteDataSource>(
    () => MovieRemoteDataSource(sl()),
  );
  sl.registerLazySingleton<BaseMovieLocalDataSource>(
    () => MovieLocalDataSource(),
  );

  sl.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(sl(), sl()),
  );
  sl.registerLazySingleton(
    () => GetNowPlayingMoviesUsecase(sl()),
  );
  sl.registerLazySingleton(
    () => GetPopularMoviesUsecase(sl()),
  );
  sl.registerLazySingleton(
    () => GetTopRatedMoviesUsecase(sl()),
  );
  sl.registerLazySingleton(
    () => GetMovieDetailsUseCase(sl()),
  );
  sl.registerLazySingleton(
    () => GetCastsUseCase(sl()),
  );
  sl.registerLazySingleton(
    () => GetTrailerUseCase(sl()),
  );
  sl.registerLazySingleton(
    () => GetSearchMoviesUseCase(sl()),
  );
  sl.registerLazySingleton(
    () => GetFavoriteMoviesUseCase(sl()),
  );

  sl.registerLazySingleton(
    () => GetRecommendationMoviesUsecase(sl()),
  );
}
