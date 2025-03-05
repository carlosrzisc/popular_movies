import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:movies_api/movies_api.dart';
import 'package:popular_movies/presentation/screens/movie_details/cubit/genres_cubit.dart';

class MovieGenresListView extends StatelessWidget {
  const MovieGenresListView(this.movie, {super.key});
  final TMovie movie;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I.get<GenresCubit>()..loadGenres(movie),
      child: BlocBuilder<GenresCubit, List<Genre>>(
        builder: (context, genres) {
          return SizedBox(
            height: 60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: genres.length,
              itemBuilder: (context, index) {
                final genre = genres[index];
                return Padding(
                  padding: const EdgeInsets.all(4),
                  child: Chip(label: Text(genre.name ?? '')),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
