import 'package:flutter/material.dart';
import 'package:movies_api/movies_api.dart';
import 'package:popular_movies/presentation/widgets/movie_poster_image.dart';

class MovieItem extends StatelessWidget {
  const MovieItem(this._movie, {this.onTap, super.key});
  final TMovie _movie;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: onTap, child: MoviePosterImage(_movie));
  }
}
