import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../films.dart';

@immutable
abstract class FilmsState extends Equatable {}

class FilmsInitialState extends FilmsState {
  @override
  List<Object?> get props => [];
}

class FilmsLoadedState extends FilmsState {
  final List<Film> films;

  FilmsLoadedState(this.films);

  @override
  List<Object?> get props => [films];
}

class FilmSelectedState extends FilmsLoadedState {
  final Film selectedFilm;

  FilmSelectedState(this.selectedFilm, List<Film> films) : super(films);

  @override
  List<Object?> get props => [selectedFilm, films];
}

class FilmsErrorState extends FilmsState {
  final String? error;

  FilmsErrorState(this.error);

  @override
  List<Object?> get props => [];
}
