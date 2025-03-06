import 'package:hive_ce/hive.dart';
import 'package:movies_api/movies_api.dart';

class HiveMovie extends HiveObject {
  HiveMovie({
    required this.id,
    this.title,
    this.genreIds,
    this.overview,
    this.posterPath,
    this.releaseDate,
  });

  final int id;
  final String? title;
  List<int>? genreIds;
  String? overview;
  String? posterPath;
  DateTime? releaseDate;

  factory HiveMovie.fromJson(Map<String, dynamic> json) => HiveMovie(
    id: json['id'],
    title: json['title'],
    genreIds: json['genreIds'],
    overview: json['overview'],
    posterPath: json['posterPath'],
    releaseDate: json['releaseDate'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'genreIds': genreIds,
    'overview': overview,
    'posterPath': posterPath,
    'releaseDate': releaseDate,
  };

  TMovie toTMovie() => TMovie(
    id: id,
    title: title,
    genreIds: genreIds,
    overview: overview,
    posterPath: posterPath,
    releaseDate: releaseDate,
  );

  static HiveMovie fromTMovie(TMovie movie) => HiveMovie(
    id: movie.id!,
    title: movie.title,
    genreIds: movie.genreIds,
    overview: movie.overview,
    posterPath: movie.posterPath,
    releaseDate: movie.releaseDate,
  );
}
