import 'package:movies_api/movies_api.dart';

abstract class MoviesDatabase {
  Future<void> save(TMovie movie);
  Future<void> saveAll(List<TMovie> movies);
  Future<List<TMovie>> search(String query);
  Future<void> delete(TMovie movie);
}
