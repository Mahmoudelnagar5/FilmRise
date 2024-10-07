import 'package:dartz/dartz.dart';
import 'package:flimrize/features/movies/domain/repository/movie_repository.dart';

import '../../../../core/errors/failures.dart';
import '../entities/movie.dart';

class GetPopularMoviesUsecase {
  final MovieRepository movieRepository;

  GetPopularMoviesUsecase(this.movieRepository);

  Future<Either<Failure, List<Movie>>> call() async {
    return await movieRepository.getPopularMovies();
  }
}
