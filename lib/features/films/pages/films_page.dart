import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../ui/ui.dart';
import '../../features.dart';

class FilmsPage extends StatelessWidget {
  const FilmsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: true,
            title: const Text('Star Wars Episodes'),
          ),
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Star Wars Episodes'),
      ),
      body: BlocConsumer<FilmsCubit, FilmsState>(
        listener: (context, state) {
          if (state is FilmSelectedState) {
            //_openFilmDetails(context, state);
          }
        },
        buildWhen: (currentState, newState) => currentState != newState,
        builder: (context, state) {
          return FadeInSwitcher(
            duration: const Duration(milliseconds: 600),
            child: state is FilmsLoadedState ? _body(state) : const LoadingIndicator(),
          );
        },
      ),
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
