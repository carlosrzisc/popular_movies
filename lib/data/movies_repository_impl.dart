import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:movies_api/movies_api.dart';
import 'package:popular_movies/domain/movies_repository.dart';
import 'package:rxdart/rxdart.dart';

@LazySingleton(as: MoviesRepository)
class MoviesRepositoryImpl implements MoviesRepository {
  MoviesRepositoryImpl(this._moviesApi);
  final MoviesApi _moviesApi;
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
      hasReachedMax = page == response.totalPages;
      page++;

      _moviesStreamController.add([...currentList, ...movies]);
    } catch (e) {
      _moviesStreamController.addError(e);
    }
  }
}
