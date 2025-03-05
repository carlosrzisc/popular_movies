import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_api/movies_api.dart';
import 'package:popular_movies/presentation/screens/movie_details/view/widgets/movie_text_info.dart';

class MovieDetailsView extends StatelessWidget {
  const MovieDetailsView(this.movie, {super.key});
  final TMovie movie;

  @override
  Widget build(BuildContext context) {
    final image = movie.image;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: ListView(
        children: [
          if (image != null)
            Hero(
              tag: 'image-${movie.id}',
              child: Image(image: CachedNetworkImageProvider(image)),
            )
          else
            const SizedBox.shrink(),
          Padding(
            padding: const EdgeInsets.all(16),
            child: MovieTextInfo(movie: movie),
          ),
        ],
      ),
    );
  }
}
