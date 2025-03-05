import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:popular_movies/app/presentation/app_bloc_providers.dart';
import 'package:popular_movies/app/presentation/bloc/locale/locale_bloc.dart';
import 'package:popular_movies/app/routing/app_router.dart';
import 'package:popular_movies/l10n/arb/app_localizations.dart';
import 'package:popular_movies/presentation/theme/app_themes.dart'
    show AppThemes;

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final router = GetIt.I.get<AppRouter>();

    return MultiBlocProvider(
      providers: appBlocProviders,
      child: BlocBuilder<LocaleBloc, LocaleState>(
        builder: (context, state) {
          return MaterialApp.router(
            theme: AppThemes.darkTheme,
            debugShowCheckedModeBanner: false,
            locale: state.locale,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            routerDelegate: router.delegate(),
            routeInformationParser: router.defaultRouteParser(),
          );
        },
      ),
    );
  }
}
