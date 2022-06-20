import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import 'bloc_providers.dart';
import 'common/network/dio_extensions.dart';
import 'features/films/pages/films_page.dart';
import 'ioc.dart';
import 'ui/theme/theme.dart';

Future main() async {
  configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  Intl.defaultLocale = 'en_US';
  initializeDateFormatting(Intl.defaultLocale);
  _androidEnforceFrameRate();
  await iocContainer.get<Dio>().addCaching();
  runApp(const StarWarsApp());
}

Future<void> _androidEnforceFrameRate() async {
  if (!Platform.isAndroid) {
    return;
  }

  try {
    await FlutterDisplayMode.setHighRefreshRate();
  } on Exception {
    // TODO
  }
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
        darkTheme: AppTheme.darkTheme,
        home: const FilmsPage(),
      ),
    );
  }
}
