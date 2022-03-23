import 'package:equatable/equatable.dart';

import '../models/character.dart';

abstract class CharacterState extends Equatable {}

class CharacterInitial extends CharacterState {
  @override
  List<Object> get props => [];
}

class CharacterLoadingState extends CharacterState {
  @override
  List<Object> get props => [];
}

class CharacterLoadedState extends CharacterState {
  final Character character;

  CharacterLoadedState(this.character);

  @override
  List<Object> get props => [character];
}

class CharacterNotFoundState extends CharacterState {
  @override
  List<Object> get props => [];
}
