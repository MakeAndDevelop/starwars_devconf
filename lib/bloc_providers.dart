import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/features.dart';
import 'ioc.dart';

class BlocProviders {
  static final List<BlocProvider> globalProviders = [
    BlocProvider<FilmsCubit>(
      create: (_) => iocContainer.get<FilmsCubit>(),
    ),
    BlocProvider<CharacterCubit>(
      create: (_) => iocContainer.get<CharacterCubit>(),
    ),
  ];
}
