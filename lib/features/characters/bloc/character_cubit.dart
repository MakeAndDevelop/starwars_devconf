import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../data/character_data_source.dart';
import 'character_state.dart';

@Injectable()
class CharacterCubit extends Cubit<CharacterState> {
  final CharacterDataSource _dataSource;

  CharacterCubit(this._dataSource) : super(CharacterInitial());

  Future<void> loadCharacter(String id) async {
    emit(CharacterLoadingState());

    final character = await _dataSource.getCharacter(id);

    if (character != null) {
      emit(CharacterLoadedState(character));
      return;
    }

    emit(CharacterNotFoundState());
  }
}
