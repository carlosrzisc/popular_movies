import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:movies_api/movies_api.dart';
import 'package:popular_movies/app/routing/app_router.dart';
import 'package:popular_movies/presentation/screens/home/bloc/home_bloc.dart';
import 'package:popular_movies/presentation/screens/home/view/widgets/movies_gridview.dart';
import 'package:popular_movies/presentation/screens/home/view/widgets/movies_input_search.dart';
import 'package:popular_movies/presentation/theme/app_colors.dart';
import 'package:popular_movies/presentation/utilities/extensions/context_extensions.dart';
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
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Stack(
              children: [
                if (state is LoadInProgress) ...[
                  const LoadingScreen(),
                ] else if (state is LoadMoviesSuccess) ...[
                  Stack(
                    children: [
                      OrientationBuilder(
                        builder: (context, orientation) {
                          return MoviesGridView(
                            state.movies,
                            onItemTap:
                                (movie) => _onMovieSelected(context, movie),
                            columnsCount:
                                orientation == Orientation.landscape ? 4 : 2,
                          );
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 60, 15, 0),
                        child: MoviesInputSearch(
                          onSearch:
                              (text) => context.read<HomeBloc>().add(
                                HomeEvent.search(text),
                              ),
                          onClear:
                              () => context.read<HomeBloc>().add(
                                const HomeEvent.load(),
                              ),
                        ),
                      ),
                    ],
                  ),
                ] else if (state is LoadMoviesFailure) ...[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        context.l10n.genericError,
                        textAlign: TextAlign.center,
                        style: context.textTheme.bodyLarge?.copyWith(
                          color: AppColors.error,
                        ),
                      ),
                      FilledButton(
                        onPressed:
                            () =>
                                context.read<HomeBloc>().add(HomeEvent.load()),
                        child: Text(context.l10n.reload),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          );
        },
        buildWhen: (previous, current) => current is! LoadInProgress,
      ),
    );
  }

  void _onMovieSelected(BuildContext context, TMovie movie) {
    context.router.push(MovieDetailsRoute(movie: movie));
  }
}
