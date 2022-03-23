import 'package:flutter/material.dart';

class FillRemainingScrollView extends StatelessWidget {
  final Widget child;
  final ScrollController? scrollController;

  const FillRemainingScrollView({Key? key, required this.child, this.scrollController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      physics: const ClampingScrollPhysics(),
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: child,
        ),
      ],
    );
  }
}
