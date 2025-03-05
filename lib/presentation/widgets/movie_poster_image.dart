import 'package:cached_network_image/cached_network_image.dart';
import 'package:popular_movies/presentation/screens/screens.dart';

class MoviePosterImage extends StatelessWidget {
  const MoviePosterImage(this.movie, {super.key});
  final TMovie movie;

  @override
  Widget build(BuildContext context) {
    final image = movie.image;
    return image != null
        ? Hero(
          tag: 'image-${movie.id}',
          child: Image(image: CachedNetworkImageProvider(image)),
        )
        : const SizedBox.shrink();
  }
}
