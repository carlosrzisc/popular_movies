import 'package:popular_movies/presentation/screens/movie_details/view/widgets/movie_genres_list_view.dart';
import 'package:popular_movies/presentation/screens/screens.dart';
import 'package:popular_movies/presentation/utilities/extensions/context_extensions.dart';
import 'package:popular_movies/presentation/utilities/extensions/date_time.dart';

class MovieTextInfo extends StatelessWidget {
  const MovieTextInfo({super.key, required this.movie});

  final TMovie movie;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(movie.title ?? '', style: context.textTheme.headlineMedium),
        Text(
          movie.releaseDate?.formattedDate() ?? '',
          style: context.textTheme.bodySmall,
        ),
        MovieGenresListView(movie),
        const SizedBox(height: 20),
        Text(movie.overview ?? '', style: context.textTheme.bodyLarge),
      ],
    );
  }
}
