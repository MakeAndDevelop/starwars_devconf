import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../ui/ui.dart';
import '../../features.dart';

class FilmDetailsSliver extends StatelessWidget {
  const FilmDetailsSliver({
    Key? key,
    required Film film,
  })  : _film = film,
        super(key: key);

  final Film _film;

  @override
  Widget build(BuildContext context) {
    return SliverContainer(
      padding: const EdgeInsets.symmetric(
        vertical: Insets.inset16,
        horizontal: Insets.inset12,
      ),
      child: Wrap(
        children: [
          LabelBox(
            label: 'Release date:',
            value: DateFormat.yMd().format(_film.releaseDate),
          ),
          LabelBox(
            label: 'Director:',
            value: _film.director,
          ),
          LabelBox(
            label: 'Episode:',
            value: _film.episodeId.toString(),
          ),
        ],
      ),
    );
  }
}
