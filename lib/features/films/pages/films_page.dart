import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../ui/theme/spacing.dart';
import '../../../ui/ui.dart';
import '../../features.dart';

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
            openFilmDetails(context, state);
          }
        },
        builder: (context, state) {
          if (state is FilmsLoadedState) {
            return FilmList(
              films: state.films,
            );
          }
          return const Center(
            child: Text('Loading'),
          );
        },
      ),
    );
  }

  Future<void> openFilmDetails(BuildContext context, FilmSelectedState state) async {
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

class FilmList extends StatelessWidget {
  final List<Film> films;

  const FilmList({Key? key, required this.films}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Insets.all16,
      child: ListView.builder(
        itemCount: films.length,
        itemBuilder: (context, index) => FilmListItem(
          film: films[index],
        ),
      ),
    );
  }
}

class FilmListItem extends StatelessWidget {
  final Film film;

  const FilmListItem({Key? key, required this.film}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Insets.vertical8,
      child: Card(
        child: InkWell(
          onTap: () => BlocProvider.of<FilmsCubit>(context).selectFilm(film.episodeId),
          child: Row(
            children: [
              Image.network(
                'https://starwars-visualguide.com/assets/img/films/${film.id}.jpg',
                width: 80,
                height: 80,
                alignment: Alignment.topCenter,
                fit: BoxFit.fitWidth,
              ),
              Spacing.width8,
              Expanded(
                child: Text(film.title),
              ),
              Spacing.width8,
              Text(
                '${film.episodeId}',
                style: const TextStyle(fontSize: 20),
              ),
              Spacing.width24,
            ],
          ),
        ),
      ),
    );
  }
}
