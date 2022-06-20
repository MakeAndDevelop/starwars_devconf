import 'dart:ui';

import 'package:flutter/material.dart';

import '../../theme/colors.dart';

class DefaultAppBar extends StatelessWidget {
  final Widget? title;
  final double? expandedHeight;

  const DefaultAppBar({Key? key, this.title, this.expandedHeight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      shadowColor: ThemeColors.shadowColor,
      floating: true,
      expandedHeight: expandedHeight,
      elevation: 1,
      forceElevated: true,
      flexibleSpace: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: ThemeColors.borderColor),
              ),
            ),
            child: FlexibleSpaceBar(
              centerTitle: true,
              title: title,
              background: Image.network(
                'https://naboonews.com//wp-content/uploads/2019/04/mural1.jpg',
                fit: BoxFit.cover,
                color: Colors.white.withOpacity(0.2),
                colorBlendMode: BlendMode.modulate,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
