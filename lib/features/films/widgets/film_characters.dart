import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../ui/ui.dart';

class FilmSubItems extends StatelessWidget {
  const FilmSubItems({
    Key? key,
    required this.items,
    required this.urlPrefix,
  }) : super(key: key);

  final List<String> items;
  final String urlPrefix;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: SizedBox(
        height: 100,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: Insets.all8,
              child: Card(
                clipBehavior: Clip.antiAlias,
                shape: const CircleBorder(
                  side: BorderSide(color: ThemeColors.yellow),
                ),
                child: CachedNetworkImage(
                  imageUrl: 'https://starwars-visualguide.com/assets/img/$urlPrefix/${items[index]}.jpg',
                  placeholder: (context, url) => Container(
                    color: ThemeColors.black,
                  ),
                  errorWidget: (context, url, error) => Container(
                    color: ThemeColors.black,
                    child: const Icon(
                      Icons.blur_off,
                      color: ThemeColors.yellow,
                    ),
                  ),
                  height: 64,
                  width: 64,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
