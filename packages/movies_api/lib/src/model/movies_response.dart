import 'package:freezed_annotation/freezed_annotation.dart';

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
    bool? adult,
    @JsonKey(name: 'backdrop_path') String? backdropPath,
    @JsonKey(name: 'genre_ids') List<int>? genreIds,
    int? id,
    @JsonKey(name: 'original_language') String? originalLanguage,
    @JsonKey(name: 'original_title') String? originalTitle,
    String? overview,
    double? popularity,
    @JsonKey(name: 'poster_path') String? posterPath,
    @JsonKey(name: 'release_date') DateTime? releaseDate,
    String? title,
    bool? video,
    @JsonKey(name: 'vote_average') double? voteAverage,
    @JsonKey(name: 'vote_count') int? voteCount,
  }) = _TMovie;

  factory TMovie.fromJson(Map<String, dynamic> json) => _$TMovieFromJson(json);
}
