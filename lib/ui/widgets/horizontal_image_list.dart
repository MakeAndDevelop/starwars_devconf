import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../common/enums/star_wars_entity.dart';
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
                child: Material(
                  child: InkWell(
                    onTap: () => itemTapped?.call(items[index]),
                    child: CachedNetworkImage(
                      imageUrl: ImageUtility.imageFor(items[index], type),
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
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
