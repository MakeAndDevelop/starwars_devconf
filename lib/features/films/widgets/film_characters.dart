import 'package:flutter/material.dart';

import '../../../ui/ui.dart';

class FilmCharacters extends StatelessWidget {
  const FilmCharacters({
    Key? key,
    required this.characters,
  }) : super(key: key);

  final List<String> characters;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: SizedBox(
        height: 100,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: characters.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: Insets.all8,
              child: Card(
                clipBehavior: Clip.antiAlias,
                shape: const CircleBorder(
                  side: BorderSide(color: ThemeColors.yellow),
                ),
                child: Image.network(
                  'https://starwars-visualguide.com/assets/img/characters/${characters[index]}.jpg',
                  width: 56,
                  height: 56,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
