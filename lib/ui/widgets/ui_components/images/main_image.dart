import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../ui.dart';

class MainImage extends StatelessWidget {
  const MainImage({
    Key? key,
    required String imageUrl,
  })  : _imageUrl = imageUrl,
        super(key: key);

  final String _imageUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 440,
      width: 320,
      child: Card(
          margin: Insets.zero,
          elevation: 2,
          shape: const RoundedRectangleBorder(
            borderRadius: ThemeConstants.mainItemRadius,
            side: BorderSide(color: ThemeColors.borderColor),
          ),
          child: CachedNetworkImage(
            imageUrl: _imageUrl,
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
          )),
    );
  }
}
