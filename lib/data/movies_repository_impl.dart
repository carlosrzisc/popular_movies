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
    if (hasReachedMax) return;

    try {
      final response = await _moviesApi.getPopularMovies(page: page);
      final movies = response.results;
      if (movies == null) {
        _moviesStreamController.addError(Exception('Error fetching movies'));
        return;
      }

      final currentList =
          _moviesStreamController.hasValue
              ? _moviesStreamController.value
              : <TMovie>[];
      hasReachedMax = page >= (response.totalPages ?? 1);
      page++;

      final allMovies = <TMovie>{...currentList, ...movies}.toList();
      _moviesStreamController.add(allMovies);
      _database.saveAll(movies);
    } catch (e) {
      _moviesStreamController.addError(e);
    }
  }

  @override
  Future<List<TMovie>> search(String query) => _database.search(query);
}
