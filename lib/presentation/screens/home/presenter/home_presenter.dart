import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:movies_api/movies_api.dart';
import 'package:popular_movies/presentation/screens/home/bloc/home_bloc.dart';
import 'package:popular_movies/presentation/screens/home/view/widgets/movies_gridview.dart';
import 'package:popular_movies/presentation/widgets/loading/loading_screen.dart';

class HomePresenter extends StatelessWidget {
  const HomePresenter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              GetIt.I.get<HomeBloc>()
                ..add(const HomeEvent.subscriptionRequested())
                ..add(const HomeEvent.load()),
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          switch (state) {
            case LoadInProgress():
              AppLoading.showLoading(context);
              break;
            default:
              context.router.pop();
          }
        },
        builder: (context, state) {
          return Stack(
            children: [
              if (state is LoadInProgress) ...[
                const LoadingScreen(),
              ] else if (state is LoadMoviesSuccess) ...[
                MoviesGridView(
                  state.movies,
                  onItemTap: (movie) => _onMovieSelected(context, movie),
                ),
              ],
            ],
          );
        },
        buildWhen: (previous, current) => current is! LoadInProgress,
      ),
    );
  }

  void _onMovieSelected(BuildContext context, TMovie movie) {}
}
