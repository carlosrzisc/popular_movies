import 'package:movies_api/movies_api.dart';

/// Movies repository
abstract class MoviesRepository {
  /// Returns a listeneable stream of movies.
  Stream<List<TMovie>> get movies;

  /// Returns a list of genres.
  Future<void> loadMore();

  /// Searches for movies.
  Future<List<TMovie>> search(String query);
}
