import 'package:flutter/material.dart';
import 'package:movies_api/movies_api.dart';
import 'package:popular_movies/presentation/screens/movie_details/view/widgets/movie_text_info.dart';
import 'package:popular_movies/presentation/widgets/movie_poster_image.dart';

class MovieDetailsView extends StatelessWidget {
  const MovieDetailsView(this.movie, {super.key});
  final TMovie movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: ListView(
        children: [
          MoviePosterImage(movie),
          Padding(
            padding: const EdgeInsets.all(16),
            child: MovieTextInfo(movie: movie),
          ),
        ],
      ),
    );
  }
}
