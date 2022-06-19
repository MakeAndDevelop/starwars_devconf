import 'dart:ui';

import 'package:flutter/material.dart';

import '../../theme/colors.dart';

class DefaultAppBar extends StatelessWidget {
  final Widget? title;

  const DefaultAppBar({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      shadowColor: ThemeColors.shadowColor,
      floating: true,
      expandedHeight: 120,
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
            ),
          ),
        ),
      ),
      backgroundColor: Colors.transparent,
    );
  }
}
