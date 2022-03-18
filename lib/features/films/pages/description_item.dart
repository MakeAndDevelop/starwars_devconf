import 'package:flutter/material.dart';

import '../../../ui/theme/spacing.dart';

class DescriptionItem extends StatelessWidget {
  const DescriptionItem({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Text(label),
        ),
        Spacing.width8,
        Expanded(
          flex: 6,
          child: Text(value),
        ),
      ],
    );
  }
}
