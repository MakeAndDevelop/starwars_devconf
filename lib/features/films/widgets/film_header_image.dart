import 'package:flutter/material.dart';

import '../../../ui/ui.dart';

class FilmHeaderImage extends StatelessWidget {
  const FilmHeaderImage({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 340,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: Insets.inset32,
          horizontal: Insets.inset56,
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
