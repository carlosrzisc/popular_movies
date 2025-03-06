import 'package:movies_api/movies_api.dart';

/// Genres repository
abstract class GenresRepository {
  /// Returns a list of genres.
  Future<List<Genre>> get genres;
}
