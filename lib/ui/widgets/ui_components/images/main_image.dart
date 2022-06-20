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
        child: Image.network(
          _imageUrl,
          fit: BoxFit.cover,
          alignment: Alignment.centerRight,
        ),
      ),
    );
  }
}
