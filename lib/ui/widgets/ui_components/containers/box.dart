import 'package:flutter/material.dart';

import '../../../ui.dart';

class Box extends StatelessWidget {
  final Widget child;

  const Box({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: ThemeConstants.smallItemRadius,
        border: Border.all(
          color: ThemeColors.secondaryTextColor,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      padding: const EdgeInsets.symmetric(
        vertical: Insets.inset8,
        horizontal: Insets.inset12,
      ),
      child: child,
    );
  }
}

class LabelBox extends StatelessWidget {
  final String label;
  final String value;

  const LabelBox({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Insets.all4,
      child: Box(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label.toUpperCase(),
              style: context.textTheme.bodyText2,
            ),
            Text(
              value,
              style: context.textTheme.bodyText1?.copyWith(color: ThemeColors.textColor),
            ),
          ],
        ),
      ),
    );
  }
}
