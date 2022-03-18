import 'package:flutter/material.dart';

class FadeInSwitcher extends StatelessWidget {
  final Widget child;
  final Duration duration;

  const FadeInSwitcher({
    Key? key,
    required this.child,
    this.duration = const Duration(milliseconds: 200),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: duration,
      switchInCurve: Curves.easeInOutCubic,
      switchOutCurve: Curves.easeInOutCubic,
      child: child,
    );
  }
}
