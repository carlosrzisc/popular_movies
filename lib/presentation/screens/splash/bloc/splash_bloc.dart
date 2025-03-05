import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:popular_movies/domain/genres_repository.dart';

part 'splash_bloc.freezed.dart';
part 'splash_event.dart';
part 'splash_state.dart';

@injectable
class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc(this._genresRepository) : super(const SplashState.initial()) {
    on<_Load>(_onLoad);
  }
  final GenresRepository _genresRepository;

  Future<void> _onLoad(_Load event, Emitter<SplashState> emit) async {
    emit(const SplashState.loadInProgress());

    // preload genres, so loading movie details is faster
    try {
      await _genresRepository.genres;
    } catch (error) {
      emit(const SplashState.loadFailure());
    }
    emit(const SplashState.loaded());
  }
}
