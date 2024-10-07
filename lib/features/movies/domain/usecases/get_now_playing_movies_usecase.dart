import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/movie.dart';
import '../repository/movie_repository.dart';

class GetNowPlayingMoviesUsecase {
  final MovieRepository movieRepository;

  GetNowPlayingMoviesUsecase(this.movieRepository);

  Future<Either<Failure, List<Movie>>> call() async {
    return await movieRepository.getNowPlayingMovies();
  }
}
