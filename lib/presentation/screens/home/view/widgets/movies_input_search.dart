import 'package:flutter/material.dart';
import 'package:popular_movies/l10n/l10n.dart';

class MoviesInputSearch extends StatefulWidget {
  const MoviesInputSearch({this.onSearch, this.onClear, super.key});
  final void Function(String)? onSearch;
  final VoidCallback? onClear;

  @override
  State<MoviesInputSearch> createState() => _MoviesInputSearchState();
}

class _MoviesInputSearchState extends State<MoviesInputSearch> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.light(),
      child: Card(
        elevation: 6,
        shape: ShapeBorder.lerp(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          1,
        ),
        child: TextField(
          controller: _controller,
          onChanged: _onChanged,
          decoration: InputDecoration(
            hintText: context.l10n.searchMovies,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 5,
            ),
            filled: true,
            suffixIcon: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                _controller.clear();
                widget.onClear?.call();
              },
            ),
            fillColor: Theme.of(context).textTheme.bodyMedium?.color,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }

  void _onChanged(String value) {
    if (value.isEmpty) {
      widget.onClear?.call();
      return;
    }
    widget.onSearch?.call(value);
  }
}
