import 'package:flutter/material.dart';
import 'package:movies_api/movies_api.dart';
import 'package:popular_movies/presentation/screens/movie_details/view/widgets/movie_text_info.dart';
import 'package:popular_movies/presentation/widgets/movie_poster_image.dart';

class MovieDetailsViewLandscape extends StatelessWidget {
  const MovieDetailsViewLandscape(this.movie, {super.key});
  final TMovie movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Row(
        children: [
          Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MoviePosterImage(movie),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: MovieTextInfo(movie: movie),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
