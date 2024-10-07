import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/cast.dart';
import '../repository/movie_repository.dart';

class GetCastsUseCase {
  final MovieRepository repository;

  GetCastsUseCase(this.repository);
  Future<Either<Failure, List<Cast>>> call(int movieId) async {
    return await repository.getCasts(movieId);
  }
}
