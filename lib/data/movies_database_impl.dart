import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_api/movies_api.dart';
import 'package:popular_movies/domain/movies_database.dart';
import 'package:popular_movies/hive/table/hive_movie.dart';

@Singleton(as: MoviesDatabase)
class MoviesDatabaseImpl implements MoviesDatabase {
  MoviesDatabaseImpl(this._moviesBox);
  final Box<HiveMovie> _moviesBox;

  @override
  Future<void> delete(TMovie movie) => _moviesBox.delete(movie.id);

  @override
  Future<void> save(TMovie movie) =>
      _moviesBox.put(movie.id, HiveMovie.fromTMovie(movie));

  @override
  Future<void> saveAll(List<TMovie> movies) async {
    final hiveMovies = {
      for (var movie in movies) movie.id: HiveMovie.fromTMovie(movie),
    };
    await _moviesBox.putAll(hiveMovies);
  }

  @override
  Future<List<TMovie>> search(String query) async {
    final movies = _moviesBox.values
        .whereType<HiveMovie>()
        .where(
          (e) => e.title?.toLowerCase().contains(query.toLowerCase()) ?? false,
        )
        .map((e) => e.toTMovie());
    return movies.toList();
  }
}
