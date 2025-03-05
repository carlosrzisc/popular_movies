import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movies_api/movies_api.dart';

part 'movies_response.freezed.dart';
part 'movies_response.g.dart';

@freezed
abstract class MoviesResponse with _$MoviesResponse {
  const factory MoviesResponse({
    int? page,
    List<TMovie>? results,
    @JsonKey(name: 'total_pages') int? totalPages,
    @JsonKey(name: 'total_results') int? totalResults,
  }) = _MoviesResponse;

  factory MoviesResponse.fromJson(Map<String, dynamic> json) =>
      _$MoviesResponseFromJson(json);
}

@freezed
abstract class TMovie with _$TMovie {
  const factory TMovie({
    @JsonKey(name: 'genre_ids') List<int>? genreIds,
    int? id,
    String? overview,
    @JsonKey(name: 'poster_path') String? posterPath,
    @JsonKey(name: 'release_date') DateTime? releaseDate,
    String? title,
  }) = _TMovie;

  const TMovie._();

  String? get image =>
      posterPath != null ? 'https://image.tmdb.org/t/p/w500/$posterPath' : null;

  List<Genre> genresFrom(List<Genre> genresList) =>
      genreIds
          ?.map((id) {
            return genresList.firstWhere(
              (element) => element.id == id,
              orElse: () => Genre(),
            );
          })
          .where((e) => e.id != null)
          .toList() ??
      [];

  factory TMovie.fromJson(Map<String, dynamic> json) => _$TMovieFromJson(json);
}
