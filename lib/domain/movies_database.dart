import 'package:movies_api/movies_api.dart';

/// Interface for a database that stores movies.
abstract class MoviesDatabase {
  /// Saves a movie to the database.
  Future<void> save(TMovie movie);

  /// Saves a list of movies to the database.
  Future<void> saveAll(List<TMovie> movies);

  /// Searches for movies in the database.
  Future<List<TMovie>> search(String query);

  /// Deletes a movie from the database.
  Future<void> delete(TMovie movie);
}
