import 'package:flutter/material.dart';

import '../../../../generated/assets.dart';
import '../../../ui.dart';

/// Full screen widget that displays a background image.
class BodyContainer extends StatelessWidget {
  final Widget child;

  /// Full screen widget that displays a background image.
  const BodyContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: const DecorationImage(
            colorFilter: ColorFilter.mode(ThemeColors.backgroundFilter, BlendMode.dstATop),
            image: AssetImage(Assets.imagesBackgroundBlurred),
            fit: BoxFit.cover),
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Colors.black,
            Colors.brown[600]!,
          ],
        ),
      ),
      child: child,
    );
  }
}
