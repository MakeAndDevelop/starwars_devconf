import 'dart:ui';

import 'package:flutter/material.dart';

class HeaderBackgroundImageWidget extends StatefulWidget {
  final ScrollController scrollController;
  final String imageUrl;

  const HeaderBackgroundImageWidget({
    Key? key,
    required this.scrollController,
    required this.imageUrl,
  }) : super(key: key);

  @override
  State<HeaderBackgroundImageWidget> createState() => _HeaderBackgroundImageWidgetState();
}

class _HeaderBackgroundImageWidgetState extends State<HeaderBackgroundImageWidget> {
  double _backgroundPosition = 0.0;

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_onScroll);
    super.dispose();
  }

  void _onScroll() {
    setState(() {
      _backgroundPosition = -(widget.scrollController.offset * 0.5);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: _backgroundPosition,
      left: 0,
      right: 0,
      height: 380,
      child: Container(
        height: 380,
        width: double.maxFinite,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(widget.imageUrl),
            fit: BoxFit.fitWidth,
            opacity: 0.6,
          ),
        ),
        child: ClipRRect(
          // make sure we apply clip it properly
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
            child: Container(
              alignment: Alignment.center,
              color: Colors.white.withOpacity(0.1),
              child: const SizedBox(),
            ),
          ),
        ),
      ),
    );
  }
}
