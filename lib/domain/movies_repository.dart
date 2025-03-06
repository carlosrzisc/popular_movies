import 'package:movies_api/movies_api.dart';

abstract class MoviesRepository {
  Stream<List<TMovie>> get movies;
  Future<void> loadMore();
  Future<List<TMovie>> search(String query);
}
