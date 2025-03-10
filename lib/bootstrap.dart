import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:popular_movies/app/config/injector.dart';
import 'package:popular_movies/hive/hive_registrar.g.dart';

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  // Bloc.observer = const AppBlocObserver();

  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    // hive
    await Hive.initFlutter();
    Hive.registerAdapters();

    // dependency injection
    await configure();
    runApp(await builder());
  }, (error, stackTrace) => log(error.toString(), stackTrace: stackTrace));
}
