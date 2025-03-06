import 'package:app_storage/app_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_api/movies_api.dart';
import 'package:popular_movies/app/routing/app_router.dart';
import 'package:popular_movies/hive/table/hive_boxes.dart';
import 'package:popular_movies/hive/table/hive_movie.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Register dependency injection module
@module
abstract class RegisterModule {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @lazySingleton
  StorageService get storageService =>
      StorageServiceImpl(GetIt.I.get<SharedPreferences>());

  @lazySingleton
  AppRouter get appRouter => AppRouter();

  @singleton
  MoviesApi get api =>
      MoviesApi(apiToken: const String.fromEnvironment('API_TOKEN'));

  @preResolve
  Future<Box<HiveMovie>> get moviesBox =>
      Hive.openBox<HiveMovie>(moviesBoxName);
}
