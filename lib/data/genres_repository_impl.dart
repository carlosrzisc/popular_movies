import 'package:injectable/injectable.dart';
import 'package:movies_api/movies_api.dart';
import 'package:popular_movies/domain/genres_repository.dart';

@LazySingleton(as: GenresRepository)
class GenresRepositoryImpl implements GenresRepository {
  const GenresRepositoryImpl(this._moviesApi);
  final MoviesApi _moviesApi;

  @override
  Future<List<Genre>> get genres async {
    final response = await _moviesApi.getGenres();
    return response.genres ?? <Genre>[];
  }
}
