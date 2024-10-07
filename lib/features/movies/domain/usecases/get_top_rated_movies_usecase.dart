import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/movie.dart';
import '../repository/movie_repository.dart';

class GetTopRatedMoviesUsecase {
  final MovieRepository movieRepository;

  GetTopRatedMoviesUsecase(this.movieRepository);

  Future<Either<Failure, List<Movie>>> call() async {
    return await movieRepository.getTopRatedMovies();
  }
}
