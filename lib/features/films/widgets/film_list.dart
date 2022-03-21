import 'package:flutter/material.dart';

import '../../../ui/ui.dart';
import '../../features.dart';
import 'film_list_item.dart';

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
