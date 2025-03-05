import 'package:movies_api/movies_api.dart';

abstract class GenresRepository {
  Future<List<Genre>> get genres;
}
