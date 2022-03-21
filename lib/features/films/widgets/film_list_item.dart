import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../ui/theme/spacing.dart';
import '../../../ui/ui.dart';
import '../../features.dart';

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
