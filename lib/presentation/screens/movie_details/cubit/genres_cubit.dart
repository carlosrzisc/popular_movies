import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_api/movies_api.dart';
import 'package:popular_movies/domain/genres_repository.dart';

/// Cubit to fetch genres
@injectable
class GenresCubit extends Cubit<List<Genre>> {
  GenresCubit(this._genresRepository) : super([]);

  final GenresRepository _genresRepository;

  /// Given that it uses cache, it's safe to call it multiple times.
  Future<void> loadGenres(TMovie movie) async {
    final genres = await _genresRepository.genres;
    emit(movie.genresFrom(genres));
  }
}
