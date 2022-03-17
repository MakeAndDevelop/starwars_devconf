import 'package:flutter/material.dart';
import 'package:starwars_devconf/features/films/widgets/film_characters.dart';

import '../../../ui/theme/spacing.dart';
import '../../../ui/ui.dart';
import '../../features.dart';
import '../models/film.dart';
import '../widgets/film_header_image.dart';
import '../widgets/opening_crawl.dart';

class FilmDetailsPage extends StatefulWidget {
  final Film film;

  const FilmDetailsPage({Key? key, required this.film}) : super(key: key);

  @override
  State<FilmDetailsPage> createState() => _FilmDetailsPageState();
}

class _FilmDetailsPageState extends State<FilmDetailsPage> {
  final ScrollController _scrollController = ScrollController();
  final ScrollController _openingCrawlController = ScrollController();
  String get _imageUrl => 'https://starwars-visualguide.com/assets/img/films/${widget.film.id}.jpg';

  @override
  void initState() {
    super.initState();
  }

  void _scrollOpeningCrawl() {
    _openingCrawlController.animateTo(
      _openingCrawlController.position.maxScrollExtent,
      duration: const Duration(seconds: 10),
      curve: Curves.linear,
    );
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance?.addPostFrameCallback((_) => _scrollOpeningCrawl());
    return Scaffold(
      body: Stack(
        children: [
          HeaderBackgroundImageWidget(
            scrollController: _scrollController,
            imageUrl: _imageUrl,
          ),
          SingleChildScrollView(
            controller: _scrollController,
            physics: const ClampingScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _openingCrawl(),
                Flexible(
                  child: Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      side: BorderSide(
                        color: Theme.of(context).backgroundColor,
                        width: 0.5,
                      ),
                    ),
                    child: Padding(
                      padding: Insets.all16,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          FilmCharacters(
                            characters: widget.film.characters,
                          ),
                          Spacing.height16,
                          _director(),
                          const SizedBox(
                            height: 800,
                            width: double.infinity,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Row _director() {
    return Row(
      children: [
        Spacing.width8,
        const Flexible(
          child: Text('Director:'),
        ),
        Spacing.width8,
        Expanded(
          child: Text(widget.film.director),
        ),
      ],
    );
  }

  Widget _openingCrawl() {
    return Container(
      width: double.infinity,
      height: 360,
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _openingCrawlController,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              OpeningCrawl(openingCrawl: widget.film.openingCrawl),
              FilmHeaderImage(imageUrl: _imageUrl),
            ],
          ),
        ),
      ),
    );
  }
}
