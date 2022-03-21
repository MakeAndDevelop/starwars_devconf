import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../ui/theme/spacing.dart';
import '../../../ui/ui.dart';
import '../../features.dart';
import '../widgets/film_list.dart';

class FilmsPage extends StatelessWidget {
  const FilmsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Star Wars Episodes'),
      ),
      body: BlocConsumer<FilmsCubit, FilmsState>(
        listener: (context, state) {
          if (state is FilmSelectedState) {
            _openFilmDetails(context, state);
          }
        },
        buildWhen: (currentState, newState) => currentState != newState,
        builder: (context, state) {
          if (state is FilmsLoadedState) {
            return _body(state);
          }
          return _loading(context);
        },
      ),
    );
  }

  Column _loading(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.rocket_launch,
          color: context.theme.primaryColor,
        ),
        Spacing.height16,
        Text(
          'Loading...',
          style: TextStyle(
            color: context.theme.primaryColor,
          ),
        ),
      ],
    );
  }

  Widget _body(FilmsLoadedState state) {
    return Column(
      children: [
        Expanded(
          flex: 9,
          child: FilmList(films: state.films),
        ),
        const Flexible(
          child: Padding(
            padding: Insets.all16,
            child: Text(
              'Powered by SWAPI',
              style: TextStyle(color: ThemeColors.yellow),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _openFilmDetails(
    BuildContext context,
    FilmSelectedState state,
  ) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (settings) => FilmDetailsPage(
          film: state.selectedFilm,
        ),
      ),
    );
  }
}
