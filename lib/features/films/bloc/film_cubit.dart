import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../features.dart';

@Injectable()
class FilmsCubit extends Cubit<FilmsState> {
  final FilmDataSource _filmDataSource;

  FilmsCubit(this._filmDataSource) : super(FilmsInitialState()) {
    initialize();
  }

  Future<void> initialize() async {
    final films = await _filmDataSource.getFilms();

    if (films != null) {
      films.sort((film, other) => film.episodeId.compareTo(other.episodeId));
      emit(FilmsLoadedState(films));
      return;
    }

    emit(FilmsErrorState('No films found'));
  }

  Future<void> selectFilm(int episodeId) async {
    final currentState = state;

    if (currentState is! FilmsLoadedState) {
      emit(FilmsErrorState('Cannot select a film'));
      return;
    }

    final selectedFilm = currentState.films.firstWhere((film) => film.episodeId == episodeId);
    emit(FilmSelectedState(selectedFilm, List.of(currentState.films)));
    emit(FilmsLoadedState(List.of(currentState.films)));
  }
}
