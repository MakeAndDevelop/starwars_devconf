import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc_providers.dart';
import 'features/films/pages/films_page.dart';
import 'ioc.dart';
import 'ui/theme/theme.dart';

void main() {
  configureDependencies();
  runApp(const StarWarsApp());
}

class StarWarsApp extends StatelessWidget {
  const StarWarsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: BlocProviders.globalProviders,
      child: MaterialApp(
        title: 'Star Wars Demo',
        theme: AppTheme.lightTheme,
        home: const FilmsPage(),
      ),
    );
  }
}
