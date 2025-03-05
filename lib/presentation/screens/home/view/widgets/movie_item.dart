import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_api/movies_api.dart';
import 'package:popular_movies/presentation/theme/app_colors.dart';

class MovieItem extends StatelessWidget {
  const MovieItem(this._movie, {this.onTap, super.key});
  final TMovie _movie;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final image = 'https://image.tmdb.org/t/p/original/${_movie.posterPath}';
    return ListTile(
      title: Hero(
        tag: 'image-${_movie.id}',
        child: Image(image: CachedNetworkImageProvider(image)),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Text(
          _movie.title ?? '',
          textAlign: TextAlign.center,
          style: GoogleFonts.bungee().copyWith(
            color: AppColors.white,
            fontSize: 12,
          ),
        ),
      ),
      onTap: onTap,
    );
  }
}
