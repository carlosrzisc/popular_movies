import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:popular_movies/app/presentation/bloc/locale/locale_bloc.dart';

final appBlocProviders = <BlocProvider>[
  BlocProvider<LocaleBloc>(
    create: (_) => GetIt.I.get<LocaleBloc>()..add(const LocaleEvent.load()),
  ),
];
