import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../common/enums/star_wars_entity.dart';
import '../../../ui/theme/spacing.dart';
import '../../../ui/ui.dart';
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
      appBar: AppBar(),
      extendBodyBehindAppBar: true,
      body: BodyContainer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // ToDo To column / sliver
              const SizedBox(height: 120),
              Row(
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
                              color: ThemeColors.textColor.withOpacity(0.6),
                            ),
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
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
              Flexible(
                child: Padding(
                  padding: Insets.all16,
                  child: Text(
                    _film.openingCrawl,
                    softWrap: true,
                    style: context.textTheme.bodyText1?.copyWith(fontSize: 16),
                    maxLines: 6,
                    overflow: TextOverflow.fade,
                  ),
                ),
              ),
              const Divider(),
              Padding(
                padding: Insets.ltr16,
                child: Text(
                  'Characters:',
                  style: context.textTheme.headline6,
                ),
              ),
              HorizontalImageList(
                items: _film.characters,
                type: StarWarsType.character,
              ),
              const Divider(),
              Padding(
                padding: Insets.ltr16,
                child: Text(
                  'Species:',
                  style: context.textTheme.headline6,
                ),
              ),
              HorizontalImageList(
                items: _film.planets,
                type: StarWarsType.species,
              ),
              const Divider(),
              Padding(
                padding: Insets.ltr16,
                child: Text(
                  'Starships:',
                  style: context.textTheme.headline6,
                ),
              ),
              HorizontalImageList(
                items: _film.starships,
                type: StarWarsType.starship,
              ),
              const Divider(),
              Padding(
                padding: Insets.ltr16,
                child: Text(
                  'Planets:',
                  style: context.textTheme.headline6,
                ),
              ),
              HorizontalImageList(
                items: _film.planets,
                type: StarWarsType.planets,
              ),
              Spacing.height40,
            ],
          ),
        ),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(),
  //     extendBodyBehindAppBar: true,
  //     body: Stack(
  //       children: [
  //         HeaderBackgroundImageWidget(
  //           scrollController: _scrollController,
  //           imageUrl: _imageUrl,
  //         ),
  //         SingleChildScrollView(
  //           controller: _scrollController,
  //           physics: const ClampingScrollPhysics(),
  //           child: Column(
  //             mainAxisSize: MainAxisSize.min,
  //             children: [
  //               _openingCrawl(),
  //               _content(context),
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Flexible _content(BuildContext context) {
    return Flexible(
      child: BottomContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.film.title,
              style: context.textTheme.headline4?.copyWith(color: ThemeColors.yellow),
            ),
            const Divider(),
            DescriptionItem(
              label: 'Director:',
              value: widget.film.director,
            ),
            Spacing.height4,
            DescriptionItem(
              label: 'Producer:',
              value: widget.film.producer,
            ),
            Spacing.height4,
            DescriptionItem(
              label: 'Release date:',
              value: DateFormat.yMd().format(widget.film.releaseDate),
            ),
            const Divider(),
            Text(
              'Starships:',
              style: context.textTheme.headline6,
            ),
            HorizontalImageList(
              items: widget.film.starships,
              type: StarWarsType.starship,
            ),
            const Divider(),
            Text(
              'Characters:',
              style: context.textTheme.headline6,
            ),
            HorizontalImageList(
              items: widget.film.characters,
              type: StarWarsType.character,
              itemTapped: (characterId) => _navigateToCharacterDetails(characterId),
            ),
            const Divider(),
            Text(
              'Planets:',
              style: context.textTheme.headline6,
            ),
            HorizontalImageList(
              items: widget.film.planets,
              type: StarWarsType.planets,
            ),
            const Divider(),
            Text(
              'Species:',
              style: context.textTheme.headline6,
            ),
            HorizontalImageList(
              items: widget.film.species,
              type: StarWarsType.species,
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
