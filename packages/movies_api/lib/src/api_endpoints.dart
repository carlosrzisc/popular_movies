/// Movies API endpoints.
class ApiEndpoints {
  /// Movies endpoint.
  /// Returns the most popular movies.
  static const movies =
      'discover/movie?include_adult=false&include_video=false&language=en-US&page={page}&sort_by=popularity.desc';

  /// Genres endpoint.
  /// Returns the registered movie genres.
  static const genres = 'genre/movie/list';
}
