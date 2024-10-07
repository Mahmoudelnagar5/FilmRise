import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/movie_details.dart';
import '../repository/movie_repository.dart';

class GetMovieDetailsUseCase {
  final MovieRepository movieRepository;

  GetMovieDetailsUseCase(this.movieRepository);

  Future<Either<Failure, MovieDetails>> call(int movieId) async {
    return await movieRepository.getMovieDetails(movieId);
  }
}
