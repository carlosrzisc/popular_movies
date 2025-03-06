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
    /// Convert the list of [TMovie] to a map of [HiveMovie] and save it to the box.
    final hiveMovies = {
      for (var movie in movies) movie.id: HiveMovie.fromTMovie(movie),
    };

    /// Save the movies to the box
    await _moviesBox.putAll(hiveMovies);
  }

  @override
  Future<List<TMovie>> search(String query) async {
    /// Get all the movies from the box
    final movies = _moviesBox.values
        .whereType<HiveMovie>()
        /// Filter the movies based on the query
        .where(
          (e) => e.title?.toLowerCase().contains(query.toLowerCase()) ?? false,
        )
        .map((e) => e.toTMovie());
    return movies.toList();
  }
}
