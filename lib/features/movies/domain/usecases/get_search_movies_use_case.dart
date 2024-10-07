import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/movie.dart';
import '../repository/movie_repository.dart';

class GetSearchMoviesUseCase {
  final MovieRepository movieRepository;

  GetSearchMoviesUseCase(this.movieRepository);

  Future<Either<Failure, List<Movie>>> call(String query) async {
    return await movieRepository.getSearchMovies(query);
  }
}
