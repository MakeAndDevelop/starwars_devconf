import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class FilmState extends Equatable {}

class FilmInitial extends FilmState {
  @override
  List<Object?> get props => [];
}

class FilmsLoadedState extends FilmState {
  @override
  List<Object?> get props => [];
}
