import 'package:equatable/equatable.dart';

import '../models/character.dart';

abstract class CharacterState extends Equatable {}

class CharacterInitial extends CharacterState {
  @override
  List<Object> get props => [];
}

class CharacterLoaded extends CharacterState {
  final Character character;

  CharacterLoaded(this.character);

  @override
  List<Object> get props => [];
}

class CharacterNotFound extends CharacterState {
  @override
  List<Object> get props => [];
}
