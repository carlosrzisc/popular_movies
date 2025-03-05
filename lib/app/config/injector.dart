import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:popular_movies/app/config/injector.config.dart';

@InjectableInit(preferRelativeImports: false)
Future<void> configure() async {
  await GetIt.instance.init();
}
