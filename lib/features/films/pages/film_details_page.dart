import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../common/enums/star_wars_entity.dart';
import '../../../ui/theme/animations.dart';
import '../../../ui/ui.dart';
import '../../../ui/widgets/slivers/sized_sliver.dart';
import '../../../ui/widgets/ui_components/containers/body_container.dart';
import '../../../ui/widgets/ui_components/containers/box.dart';
import '../../characters/character_page.dart';
import '../../features.dart';

class FilmDetailsPage extends StatefulWidget {
  final Film film;

  const FilmDetailsPage({Key? key, required this.film}) : super(key: key);

  @override
  State<FilmDetailsPage> createState() => _FilmDetailsPageState();
}

class _FilmDetailsPageState extends State<FilmDetailsPage> {
  //final ScrollController _scrollController = ScrollController();
  //final ScrollController _openingCrawlController = ScrollController();
  String get _imageUrl => ImageUtility.film(widget.film.id);
  Film get _film => widget.film;
  bool _showOpeningCrawl = false;

  @override
  void initState() {
    super.initState();
    //WidgetsBinding.instance.addPostFrameCallback((_) => _scrollOpeningCrawl());
  }

  // Future<void> _scrollOpeningCrawl() async {
  //   _openingCrawlController
  //       .animateTo(
  //     _openingCrawlController.position.maxScrollExtent,
  //     duration: const Duration(seconds: 10),
  //     curve: Curves.linear,
  //   )
  //       .then((_) {
  //     if (mounted) {
  //       setState(() {
  //         showFilmPoster = true;
  //       });
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyContainer(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Text(
                _film.title,
                style: const TextStyle(color: ThemeColors.textColor),
              ),
            ),
            const SizedSliver(height: 40),
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 440,
                    child: Card(
                      margin: Insets.zero,
                      elevation: 2,
                      shape: const RoundedRectangleBorder(
                        borderRadius: ThemeConstants.mainItemRadius,
                        side: BorderSide(color: ThemeColors.borderColor),
                      ),
                      child: Image.network(
                        _imageUrl,
                        fit: BoxFit.cover,
                        alignment: Alignment.centerRight,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: RotatedBox(
                        quarterTurns: -1,
                        child: Container(
                          padding: Insets.horizontal16,
                          width: 440,
                          child: Text(
                            _film.title.toUpperCase(),
                            softWrap: false,
                            overflow: TextOverflow.visible,
                            style: context.textTheme.headline6?.copyWith(
                              color: ThemeColors.secondaryTextColor.withOpacity(0.6),
                            ),
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: Insets.inset16,
                  horizontal: Insets.inset12,
                ),
                child: Wrap(
                  children: [
                    LabelBox(
                      label: 'Release date:',
                      value: DateFormat.yMd().format(_film.releaseDate),
                    ),
                    LabelBox(
                      label: 'Director:',
                      value: _film.director,
                    ),
                    LabelBox(
                      label: 'Episode:',
                      value: _film.episodeId.toString(),
                    ),
                  ],
                ),
              ),
            ),
            SliverContainer(
              padding: Insets.all16,
              child: AnimatedSize(
                duration: AnimationConstants.animationDuration,
                alignment: Alignment.topLeft,
                curve: Curves.easeInOut,
                child: Text(
                  _film.openingCrawl,
                  softWrap: true,
                  style: context.textTheme.bodyText1?.copyWith(fontSize: 16),
                  maxLines: _showOpeningCrawl ? null : 6,
                  overflow: TextOverflow.fade,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: Insets.zero,
                padding: Insets.horizontal16,
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () => setState(() => _showOpeningCrawl = !_showOpeningCrawl),
                  child: Row(
                    children: [
                      AnimatedRotation(
                        turns: _showOpeningCrawl ? 1.5 : 1.75,
                        duration: AnimationConstants.animationDuration,
                        curve: Curves.easeInOut,
                        child: const Icon(Icons.arrow_drop_down),
                      ),
                      Text(_showOpeningCrawl ? 'SHOW LESS' : 'SHOW MORE'),
                    ],
                  ),
                ),
              ),
            ),
            const SliverDivider(),
            SliverContainer(
              padding: Insets.ltr16,
              child: Text(
                'Characters:',
                style: context.textTheme.headline6,
              ),
            ),
            SliverToBoxAdapter(
              child: HorizontalImageList(
                items: _film.characters,
                type: StarWarsType.character,
                itemTapped: _navigateToCharacterDetails,
              ),
            ),
            const SliverDivider(),
            SliverContainer(
              padding: Insets.ltr16,
              child: Text(
                'Species:',
                style: context.textTheme.headline6,
              ),
            ),
            SliverToBoxAdapter(
              child: HorizontalImageList(
                items: _film.characters,
                type: StarWarsType.species,
              ),
            ),
            const SliverDivider(),
            SliverContainer(
              padding: Insets.ltr16,
              child: Text(
                'Starships:',
                style: context.textTheme.headline6,
              ),
            ),
            SliverToBoxAdapter(
              child: HorizontalImageList(
                items: _film.characters,
                type: StarWarsType.starship,
              ),
            ),
            const SliverDivider(),
            SliverContainer(
              padding: Insets.ltr16,
              child: Text(
                'Planets:',
                style: context.textTheme.headline6,
              ),
            ),
            SliverToBoxAdapter(
              child: HorizontalImageList(
                items: _film.characters,
                type: StarWarsType.planets,
              ),
            ),
            const SizedSliver(
              height: 120,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _navigateToCharacterDetails(String characterId) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (settings) => CharacterPage(
          characterId: characterId,
        ),
      ),
    );
  }

  // Widget _openingCrawl() {
  //   return Container(
  //     width: double.infinity,
  //     height: 360,
  //     alignment: Alignment.center,
  //     child: Padding(
  //       padding: const EdgeInsets.symmetric(horizontal: 40),
  //       child: Stack(
  //         children: [
  //           Center(
  //             child: SingleChildScrollView(
  //               physics: const NeverScrollableScrollPhysics(),
  //               //controller: _openingCrawlController,
  //               child: OpeningCrawl(openingCrawl: widget.film.openingCrawl),
  //             ),
  //           ),
  //           Center(
  //             child: FadeInSwitcher(
  //               duration: const Duration(milliseconds: 500),
  //               child: showFilmPoster ? FilmHeaderImage(imageUrl: _imageUrl) : const SizedBox(),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
