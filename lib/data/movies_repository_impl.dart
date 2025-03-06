import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:movies_api/movies_api.dart';
import 'package:popular_movies/domain/movies_database.dart';
import 'package:popular_movies/domain/movies_repository.dart';
import 'package:rxdart/rxdart.dart';

@LazySingleton(as: MoviesRepository)
class MoviesRepositoryImpl implements MoviesRepository {
  MoviesRepositoryImpl(this._moviesApi, this._database);
  final MoviesApi _moviesApi;
  final MoviesDatabase _database;
  final _moviesStreamController = BehaviorSubject<List<TMovie>>();
  int page = 1;
  bool hasReachedMax = false;

  @override
  Stream<List<TMovie>> get movies =>
      _moviesStreamController.asBroadcastStream();

  @override
  Future<void> loadMore() async {
    /// If we have reached the last page, return
    if (hasReachedMax) return;

    try {
      /// Fetch the popular movies from the API for the given page
      final response = await _moviesApi.getPopularMovies(page: page);
      final movies = response.results;
      if (movies == null) {
        /// If there was an error fetching the movies, add an error to the stream
        _moviesStreamController.addError(Exception('Error fetching movies'));
        return;
      }

      /// Get the current list of movies
      final currentList =
          _moviesStreamController.hasValue
              ? _moviesStreamController.value
              : <TMovie>[];

      /// Check if we have reached the last page
      hasReachedMax = page >= (response.totalPages ?? 1);
      page++;

      /// Combine the current list with the new list of movies
      /// Remove duplicates, somehow the API returns duplicate movies, so we need to filter them out
      final allMovies = <TMovie>{...currentList, ...movies}.toList();
      _moviesStreamController.add(allMovies);

      /// Save the movies to the database
      _database.saveAll(movies);
    } catch (e) {
      _moviesStreamController.addError(e);
    }
  }

  @override
  Future<List<TMovie>> search(String query) => _database.search(query);
}
