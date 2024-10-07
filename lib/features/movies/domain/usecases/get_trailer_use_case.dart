import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/trailer.dart';
import '../repository/movie_repository.dart';

class GetTrailerUseCase {
  final MovieRepository movieRepository;

  GetTrailerUseCase(this.movieRepository);

  Future<Either<Failure, Trailer>> call(int movieId) async {
    return await movieRepository.getTrailer(movieId);
  }
}
