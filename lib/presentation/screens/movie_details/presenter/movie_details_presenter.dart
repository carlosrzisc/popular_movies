import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:movies_api/movies_api.dart';
import 'package:popular_movies/presentation/screens/movie_details/view/widgets/modie_details_view.dart';
import 'package:popular_movies/presentation/screens/movie_details/view/widgets/modie_details_view_landscape.dart';
import 'package:popular_movies/presentation/theme/app_colors.dart';

class MovieDetailsPresenter extends StatelessWidget {
  const MovieDetailsPresenter(this.movie, {super.key});
  final TMovie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            OrientationBuilder(
              builder: (context, orientation) {
                return orientation == Orientation.landscape
                    ? MovieDetailsViewLandscape(movie)
                    : MovieDetailsView(movie);
              },
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: ClipOval(
                  child: ColoredBox(
                    color: AppColors.black.withAlpha(128),
                    child: IconButton(
                      onPressed: () => context.router.pop(),
                      icon: const Icon(Icons.close),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
