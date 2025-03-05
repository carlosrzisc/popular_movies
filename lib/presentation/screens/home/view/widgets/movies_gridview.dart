import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_api/movies_api.dart';
import 'package:popular_movies/presentation/screens/home/bloc/home_bloc.dart';
import 'package:popular_movies/presentation/screens/home/view/widgets/movie_item.dart';

class MoviesGridView extends StatefulWidget {
  const MoviesGridView(this.movies, {this.onItemTap, super.key});
  final List<TMovie> movies;
  final void Function(TMovie)? onItemTap;

  @override
  State<MoviesGridView> createState() => _MoviesGridViewState();
}

class _MoviesGridViewState extends State<MoviesGridView> {
  final _scrollController = ScrollController();
  static const gridDelegate = SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    crossAxisSpacing: 10,
    childAspectRatio: 0.65,
  );

  @override
  void initState() {
    _scrollController.addListener(() => _onScroll(context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: widget.movies.length,
      gridDelegate: gridDelegate,
      padding: const EdgeInsets.only(top: 130),
      itemBuilder:
          (_, index) => MovieItem(
            widget.movies[index],
            onTap: () => widget.onItemTap?.call(widget.movies[index]),
          ),
      controller: _scrollController,
    );
  }

  void _onScroll(BuildContext context) {
    if (_isBottom) {
      context.read<HomeBloc>().add(const HomeEvent.load());
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
