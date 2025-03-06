import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_api/movies_api.dart';
import 'package:popular_movies/domain/movies_repository.dart';

part 'home_bloc.freezed.dart';
part 'home_event.dart';
part 'home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this._moviesRepository) : super(const HomeState.initial()) {
    on<_Load>(_onLoad);
    on<_SubscriptionRequested>(_onSubscriptionRequested);
    on<_SearchMovie>(_onMovieSearch);
  }
  final MoviesRepository _moviesRepository;

  Future<void> _onSubscriptionRequested(
    _SubscriptionRequested event,
    Emitter<HomeState> emit,
  ) async {
    await emit.forEach<List<TMovie>>(
      _moviesRepository.movies,
      onData: HomeState.loadSuccess,
      onError: (error, stackTrace) => const HomeState.loadFailure(),
    );
  }

  void _onLoad(_Load event, Emitter<HomeState> emit) {
    if (state is LoadInProgress) return;

    emit(const HomeState.loadInProgress());
    _moviesRepository.loadMore();
  }

  Future<void> _onMovieSearch(_SearchMovie event, Emitter<HomeState> emit) async {
    emit(const HomeState.loadInProgress());
    final movies = await _moviesRepository.search(event.query);
    emit(HomeState.loadSuccess(movies));
  }
}
