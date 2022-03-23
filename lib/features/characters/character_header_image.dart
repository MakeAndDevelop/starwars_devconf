import 'package:flutter/material.dart';

import '../../ui/ui.dart';

class CharacterHeaderImage extends StatelessWidget {
  final String imageUrl;

  const CharacterHeaderImage({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 340,
      child: Padding(
        padding: const EdgeInsets.only(
          top: Insets.inset56,
          bottom: Insets.inset40,
          left: 96,
          right: 96,
        ),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
