import 'package:freezed_annotation/freezed_annotation.dart';

part 'genres_response.freezed.dart';
part 'genres_response.g.dart';

@freezed
abstract class GenresResponse with _$GenresResponse {
  const factory GenresResponse({List<Genre>? genres}) = _GenresResponse;

  factory GenresResponse.fromJson(Map<String, dynamic> json) =>
      _$GenresResponseFromJson(json);
}

@freezed
abstract class Genre with _$Genre {
  const factory Genre({int? id, String? name}) = _Genre;

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);
}
