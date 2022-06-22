import 'dart:ui';

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../ui/ui.dart';
import '../../features.dart';

class FilmListItem extends StatelessWidget {
  final Film film;

  const FilmListItem({Key? key, required this.film}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Insets.listItem16,
      child: OpenContainer(
        openColor: Colors.transparent,
        closedColor: Colors.transparent,
        closedElevation: 0,
        openElevation: 0,
        transitionDuration: const Duration(milliseconds: 600),
        closedBuilder: (context, action) => FilmListItemBody(film: film, action: action),
        openBuilder: (context, action) {
          return FilmDetailsPage(film: film);
        },
      ),
    );
  }
}

class FilmListItemBody extends StatelessWidget {
  const FilmListItemBody({
    Key? key,
    required this.film,
    required this.action,
  }) : super(key: key);

  final Film film;
  final void Function() action;

  String get _imageUrl => 'https://starwars-visualguide.com/assets/img/films/${film.id}.jpg';

  @override
  Widget build(BuildContext context) {
    final releaseDate = DateFormat.yMMM().format(film.releaseDate);

    return Card(
      elevation: 1,
      shadowColor: ThemeColors.shadowColor,
      shape: const RoundedRectangleBorder(
        borderRadius: ThemeConstants.itemRadius,
        side: BorderSide(color: ThemeColors.solidBorderColor),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 6.0, sigmaY: 6.0),
        child: InkWell(
          borderRadius: ThemeConstants.itemRadius,
          onTap: () {
            BlocProvider.of<FilmsCubit>(context).selectFilm(film.episodeId);
            action();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Spacing.width24,
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      film.title,
                      style: context.textTheme.headline6,
                    ),
                    Text(releaseDate),
                  ],
                ),
              ),
              Spacing.width24,
              Image.network(
                _imageUrl,
                height: 140,
                alignment: Alignment.topCenter,
                fit: BoxFit.fitHeight,
                color: Colors.brown.withOpacity(0.75),
                colorBlendMode: BlendMode.dstIn,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
