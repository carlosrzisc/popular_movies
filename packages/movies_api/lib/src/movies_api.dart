import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:movies_api/src/api_cache_options.dart';
import 'package:movies_api/src/api_endpoints.dart';
import 'package:movies_api/src/model/genres_response.dart';
import 'package:movies_api/src/model/movies_response.dart';
import 'package:retrofit/retrofit.dart';

part 'movies_api.g.dart';

@RestApi(baseUrl: 'https://api.themoviedb.org/3/')
abstract class MoviesApi {
  factory MoviesApi._(Dio dio, {String? baseUrl}) = _MoviesApi;

  factory MoviesApi({required String apiKey, String? baseUrl}) => MoviesApi._(
    Dio(
      BaseOptions(
        headers: {'Accept': 'application/json'},
        queryParameters: {'apiKey': apiKey},
      ),
    )..interceptors.add(DioCacheInterceptor(options: cacheOptions)),
    baseUrl: baseUrl,
  );

  @GET(ApiEndpoints.movies)
  Future<MoviesResponse> getPopularMovies({@Path('page') required int page});

  @GET(ApiEndpoints.genres)
  Future<GenresResponse> getGenres();
}
