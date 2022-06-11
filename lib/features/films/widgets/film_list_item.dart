import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../ui/theme/spacing.dart';
import '../../../ui/ui.dart';
import '../../features.dart';

class FilmListItem extends StatelessWidget {
  final Film film;

  const FilmListItem({Key? key, required this.film}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final releaseDate = DateFormat.yMMM().format(film.releaseDate);

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
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      film.title,
                      style: context.textTheme.headline6,
                    ),
                    Text('Release date: $releaseDate'),
                  ],
                ),
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
