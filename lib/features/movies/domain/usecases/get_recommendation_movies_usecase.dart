import 'package:dartz/dartz.dart';
import 'package:flimrize/features/movies/domain/entities/recommendation.dart';

import '../../../../core/errors/failures.dart';
import '../repository/movie_repository.dart';

class GetRecommendationMoviesUsecase {
  final MovieRepository movieRepository;

  GetRecommendationMoviesUsecase(this.movieRepository);

  Future<Either<Failure, List<Recommendation>>> call(int movieId) async {
    return await movieRepository.getRecommendationMovies(movieId);
  }
}
