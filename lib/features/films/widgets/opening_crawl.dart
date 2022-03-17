import 'package:flutter/material.dart';

import '../../../ui/theme/colors.dart';
import '../../../ui/ui.dart';

class OpeningCrawl extends StatelessWidget {
  const OpeningCrawl({
    Key? key,
    required this.openingCrawl,
  }) : super(key: key);

  final String openingCrawl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 360, bottom: 360),
      child: Stack(
        children: <Widget>[
          // Stroked text as border.
          Text(
            openingCrawl,
            style: TextStyle(
              fontSize: 20,
              height: 1.6,
              foreground: Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = 2
                ..color = ThemeColors.black,
            ),
            textAlign: TextAlign.center,
            softWrap: true,
          ),
          // Solid text as fill.
          Text(
            openingCrawl,
            style: TextStyle(
              fontSize: 20,
              height: 1.6,
              color: MaterialThemeColors.yellow.shade400,
            ),
            textAlign: TextAlign.center,
            softWrap: true,
          ),
        ],
      ),
    );
  }
}
