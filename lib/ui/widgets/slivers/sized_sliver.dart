import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SizedSliver extends StatelessWidget {
  final double? height;
  final double? width;

  const SizedSliver({
    Key? key,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: height,
        width: width,
      ),
    );
  }
}

class SliverDivider extends StatelessWidget {
  const SliverDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Divider(),
    );
  }
}

class SliverContainer extends StatelessWidget {
  final EdgeInsets padding;
  final Widget child;

  const SliverContainer({
    Key? key,
    required this.padding,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: padding,
      sliver: SliverToBoxAdapter(
        child: child,
      ),
    );
  }
}
