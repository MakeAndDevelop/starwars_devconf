import 'package:flutter/material.dart';

import '../../../ui/ui.dart';
import '../films.dart';

class FilmDetailsPage extends StatefulWidget {
  final Film film;

  const FilmDetailsPage({Key? key, required this.film}) : super(key: key);

  @override
  State<FilmDetailsPage> createState() => _FilmDetailsPageState();
}

class _FilmDetailsPageState extends State<FilmDetailsPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          HeaderBackgroundImageWidget(scrollController: _scrollController),
          Positioned.fill(
            child: SingleChildScrollView(
              controller: _scrollController,
              physics: const ClampingScrollPhysics(),
              child: const Padding(
                padding: EdgeInsets.only(top: 360),
                child: SizedBox(
                  height: 800,
                  child: Card(
                    elevation: 8,
                    color: ThemeColors.background,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: SizedBox(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
