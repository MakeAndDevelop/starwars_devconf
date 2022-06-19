import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starwars_devconf/features/films/pages/description_item.dart';

import '../../common/enums/star_wars_entity.dart';
import '../../ui/theme/spacing.dart';
import '../../ui/ui.dart';
import '../../ui/widgets/slivers/sized_sliver.dart';
import '../../ui/widgets/ui_components/containers/body_container.dart';
import 'bloc/bloc.dart';
import 'models/character.dart';
import 'widgets/character_header_image.dart';

class CharacterPage extends StatefulWidget {
  final String characterId;

  const CharacterPage({Key? key, required this.characterId}) : super(key: key);

  @override
  State<CharacterPage> createState() => _CharacterPageState();
}

class _CharacterPageState extends State<CharacterPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CharacterCubit>(context).loadCharacter(widget.characterId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyContainer(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Text(
                '',
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
                        ImageUtility.character(widget.characterId),
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
                            '',
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
          ],
        ),
      ),
    );
  }

  Widget _body(CharacterLoadedState state) {
    return Stack(
      children: [
        HeaderBackgroundImageWidget(
          scrollController: _scrollController,
          imageUrl: ImageUtility.character(state.character.id),
        ),
        FillRemainingScrollView(
          scrollController: _scrollController,
          child: Column(
            children: <Widget>[
              CharacterHeaderImage(
                imageUrl: ImageUtility.character(state.character.id),
              ),
              Expanded(
                child: BottomContainer(
                  height: 800,
                  child: _content(state.character),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _content(Character character) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          character.name,
          style: context.theme.textTheme.headline4,
        ),
        const Divider(),
        DescriptionItem(
          label: 'Hair color',
          value: character.hairColor,
        ),
        Spacing.height8,
        const Divider(),
        Text(
          'Films:',
          style: context.textTheme.headline6,
        ),
        HorizontalImageList(
          items: character.films,
          type: StarWarsType.film,
        ),
      ],
    );
  }

  Center _characterNotFound() {
    return const Center(
      child: Text('Character not found! :('),
    );
  }
}
