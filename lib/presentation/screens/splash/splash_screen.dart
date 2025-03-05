import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:popular_movies/app/routing/app_router.dart';
import 'package:popular_movies/presentation/screens/splash/bloc/splash_bloc.dart';
import 'package:popular_movies/presentation/widgets/loading/loading_screen.dart';

@RoutePage()
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => GetIt.I.get<SplashBloc>()..add(const SplashEvent.load()),
      child: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          switch (state) {
            case const SplashState.loadInProgress():
              AppLoading.showLoading(context);
              break;
            default:
              context.router.replace(const HomeRoute());
              break;
          }
        },
        child: const Scaffold(body: SizedBox()),
      ),
    );
  }
}
