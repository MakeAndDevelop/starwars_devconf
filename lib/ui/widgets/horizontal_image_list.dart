import 'dart:ui';

import 'package:animations/animations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../common/enums/star_wars_entity.dart';
import '../../features/characters/character_page.dart';
import '../ui.dart';

class HorizontalImageList extends StatelessWidget {
  const HorizontalImageList({
    Key? key,
    required this.items,
    required this.type,
    this.itemTapped,
  }) : super(key: key);

  final List<String> items;
  final StarWarsType type;
  final Function(String)? itemTapped;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: Insets.inset16,
      ),
      child: SizedBox(
        height: 140,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: items.length,
          itemBuilder: (context, index) {
            return HorizontalListItem(
              type: type,
              item: items[index],
              padding: index == 0
                  ? Insets.firstListItem16
                  : index == items.length - 1
                      ? Insets.lastListItem16
                      : Insets.horizontal8,
            );
          },
        ),
      ),
    );
  }
}

class HorizontalListItem extends StatelessWidget {
  final String item;
  final StarWarsType type;
  final EdgeInsets padding;

  const HorizontalListItem({
    Key? key,
    required this.type,
    required this.item,
    required this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: OpenContainer(
        closedColor: Colors.transparent,
        closedShape: const RoundedRectangleBorder(
          borderRadius: ThemeConstants.smallItemRadius,
          side: BorderSide(color: ThemeColors.solidBorderColor),
        ),
        closedBuilder: (context, action) {
          return Card(
            clipBehavior: Clip.antiAlias,
            shape: const RoundedRectangleBorder(
              borderRadius: ThemeConstants.smallItemRadius,
              side: BorderSide(color: ThemeColors.solidBorderColor),
            ),
            elevation: 2,
            child: InkWell(
              onTap: action,
              child: CachedNetworkImage(
                imageUrl: ImageUtility.imageFor(item, type),
                placeholder: (context, url) => ClipRRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 6.0, sigmaY: 6.0),
                    child: Container(
                      color: ThemeColors.overlayColor,
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => ClipRRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 6.0, sigmaY: 6.0),
                    child: Container(
                      color: ThemeColors.overlayColor,
                      child: const Icon(
                        Icons.blur_off,
                        color: ThemeColors.textColor,
                      ),
                    ),
                  ),
                ),
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
                width: 130,
              ),
            ),
          );
        },
        openBuilder: (BuildContext context, void Function({Object? returnValue}) action) {
          switch (type) {
            case StarWarsType.character:
              return CharacterPage(characterId: item);
            case StarWarsType.starship:
              // TODO: Handle this case.
              break;
            case StarWarsType.species:
              // TODO: Handle this case.
              break;
            case StarWarsType.planets:
              // TODO: Handle this case.
              break;
            case StarWarsType.film:
              // TODO: Handle this case.
              break;
          }
          return SizedBox();
        },
      ),
    );
  }
}
