import 'package:flutter/material.dart';

import '../../../common/enums/star_wars_entity.dart';
import '../../../ui/ui.dart';
import '../../features.dart';

class FilmDetailsPage extends StatelessWidget {
  final Film film;

  const FilmDetailsPage({Key? key, required this.film}) : super(key: key);

  // Underscore indicates that this is a private member.
  String get _imageUrl => ImageUtility.film(film.id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyContainer(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Text(
                film.title,
                style: const TextStyle(color: ThemeColors.textColor),
              ),
            ),
            const SizedSliver(height: 40),
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Semantics(
                    label: 'Image of ${film.title}',
                    child: MainImage(imageUrl: _imageUrl),
                  ),
                  Expanded(
                    child: VerticalHeadline(title: film.title),
                  ),
                ],
              ),
            ),
            FilmDetailsSliver(
              film: film,
            ),
            OpeningCrawlSliver(
              film: film,
            ),
            const SliverDivider(),
            RelatedItemsSliver(
              title: 'Characters:',
              type: StarWarsType.character,
              items: film.characters,
            ),
            const SliverDivider(),
            RelatedItemsSliver(
              title: 'Species:',
              type: StarWarsType.species,
              items: film.species,
            ),
            const SliverDivider(),
            RelatedItemsSliver(
              title: 'Star ships:',
              type: StarWarsType.starship,
              items: film.starships,
            ),
            const SliverDivider(),
            RelatedItemsSliver(
              title: 'Planets:',
              type: StarWarsType.planets,
              items: film.planets,
            ),
            if (film.episodeId >= 4) ...[
              const SliverDivider(),
              RelatedItemsSliver(
                title: 'Vehicles:',
                type: StarWarsType.vehicle,
                items: film.vehicles,
              ),
            ],
            const SizedSliver(
              height: 120,
            ),
          ],
        ),
      ),
    );
  }
}
