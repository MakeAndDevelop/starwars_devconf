import 'dart:ui';

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
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: Insets.inset16,
        ),
        child: SizedBox(
          height: 140,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: index == 0
                    ? Insets.left16
                    : index == items.length - 1
                        ? Insets.right16
                        : Insets.horizontal8,
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  shape: const RoundedRectangleBorder(
                    borderRadius: ThemeConstants.smallItemRadius,
                    side: BorderSide(color: ThemeColors.solidBorderColor),
                  ),
                  elevation: 2,
                  child: InkWell(
                    onTap: () => itemTapped?.call(items[index]),
                    child: CachedNetworkImage(
                      imageUrl: ImageUtility.imageFor(items[index], type),
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
                      width: 120,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
