import 'package:flutter_bloc/flutter_bloc.dart';

import 'film_state.dart';

class FilmCubit extends Cubit<FilmState> {
  FilmCubit() : super(FilmInitial());
}
