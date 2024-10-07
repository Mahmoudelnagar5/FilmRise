import '../entities/movie_details.dart';
import '../repository/movie_repository.dart';

class GetFavoriteMoviesUseCase {
  final MovieRepository movieRepository;

  GetFavoriteMoviesUseCase(this.movieRepository);

  List<MovieDetails> call() {
    return movieRepository.getFavoriteMovies();
  }
}
