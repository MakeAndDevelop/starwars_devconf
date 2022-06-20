import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../common/enums/star_wars_entity.dart';
import '../../../ui/ui.dart';
import '../../features.dart';

class FilmDetailsPage extends StatelessWidget {
  final Film film;

  const FilmDetailsPage({Key? key, required this.film}) : super(key: key);

  String get _imageUrl => ImageUtility.film(film.id);
  Film get _film => film;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyContainer(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Text(
                _film.title,
                style: const TextStyle(color: ThemeColors.textColor),
              ),
            ),
            const SizedSliver(height: 40),
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MainImage(imageUrl: _imageUrl),
                  Expanded(
                    child: VerticalHeadline(title: _film.title),
                  ),
                ],
              ),
            ),
            FilmDetails(film: _film),
            OpeningCrawlSliver(film: _film),
            const SliverDivider(),
            RelatedItemsSliver(
              title: 'Characters:',
              type: StarWarsType.character,
              items: _film.characters,
            ),
            const SliverDivider(),
            RelatedItemsSliver(
              title: 'Species:',
              type: StarWarsType.species,
              items: _film.species,
            ),
            const SliverDivider(),
            RelatedItemsSliver(
              title: 'Star ships:',
              type: StarWarsType.starship,
              items: _film.starships,
            ),
            const SliverDivider(),
            RelatedItemsSliver(
              title: 'Planets:',
              type: StarWarsType.planets,
              items: _film.planets,
            ),
            const SizedSliver(
              height: 120,
            ),
          ],
        ),
      ),
    );
  }
}
