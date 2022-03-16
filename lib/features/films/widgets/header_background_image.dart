import 'dart:ui';

import 'package:flutter/material.dart';

class HeaderBackgroundImageWidget extends StatefulWidget {
  final ScrollController scrollController;
  const HeaderBackgroundImageWidget({
    Key? key,
    required this.scrollController,
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
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: NetworkImage('https://starwars-visualguide.com/assets/img/films/1.jpg'),
              fit: BoxFit.fitWidth,
              opacity: 0.6),
        ),
        child: ClipRRect(
          // make sure we apply clip it properly
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              alignment: Alignment.center,
              color: Colors.grey.withOpacity(0.1),
              child: const Text(
                'CHOCOLATE',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
