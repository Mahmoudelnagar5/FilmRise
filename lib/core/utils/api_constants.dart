class ApiConstants {
  static const baseUrl = "https://api.themoviedb.org/3";
  static const imageUrl = "https://image.tmdb.org/t/p/w500";
  static const apiKey = "4b63b255625b313fc0836904403d732d";

  static const String getNowPlayingMoviesPath =
      "$baseUrl/movie/now_playing?api_key=$apiKey";

  static const String getPopularMoviesPath =
      "$baseUrl/movie/popular?api_key=$apiKey";

  static const String getTopRatedMoviesPath =
      "$baseUrl/movie/top_rated?api_key=$apiKey";

  static String getImageUrl(String? path) => "$imageUrl$path";

  static String getMovieDetailsPath(int id) =>
      "$baseUrl/movie/$id?api_key=$apiKey";
  static String getCastPath(int movieId) =>
      "$baseUrl/movie/$movieId/credits?api_key=$apiKey";

  static String getSearchPath(String query) =>
      "$baseUrl/search/movie?api_key=$apiKey&query=$query";

  static String getTrailerPath(int movieId) =>
      "$baseUrl/movie/$movieId/videos?api_key=$apiKey";

  static String getRecommendationPath(int movieId) =>
      "$baseUrl/movie/$movieId/recommendations?api_key=$apiKey";
}
