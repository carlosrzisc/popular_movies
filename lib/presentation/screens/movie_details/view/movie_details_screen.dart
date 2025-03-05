import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:movies_api/movies_api.dart';
import 'package:popular_movies/presentation/screens/movie_details/presenter/movie_details_presenter.dart';

@RoutePage()
class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen(this.movie, {super.key});
  final TMovie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: MovieDetailsPresenter(movie)));
  }
}
