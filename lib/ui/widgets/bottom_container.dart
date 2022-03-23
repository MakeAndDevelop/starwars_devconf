import 'package:flutter/material.dart';

import '../ui.dart';

class BottomContainer extends StatelessWidget {
  final Widget? child;
  final double? height;

  const BottomContainer({
    Key? key,
    this.child,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: Card(
        elevation: 8,
        color: context.theme.backgroundColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          side: BorderSide(
            width: 0.5,
          ),
        ),
        child: Padding(
          padding: Insets.all16,
          child: child,
        ),
      ),
    );
  }
}
