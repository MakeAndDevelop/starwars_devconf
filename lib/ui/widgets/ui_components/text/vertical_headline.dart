import 'package:flutter/material.dart';

import '../../../ui.dart';

class VerticalHeadline extends StatelessWidget {
  final String title;

  const VerticalHeadline({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RotatedBox(
        quarterTurns: -1,
        child: Container(
          padding: Insets.horizontal16,
          width: 440,
          child: Text(
            title.toUpperCase(),
            softWrap: false,
            overflow: TextOverflow.visible,
            style: context.textTheme.headline6?.copyWith(
              color: ThemeColors.secondaryTextColor.withOpacity(0.6),
            ),
            textAlign: TextAlign.end,
          ),
        ),
      ),
    );
  }
}
