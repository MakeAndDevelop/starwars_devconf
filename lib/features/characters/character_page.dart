import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starwars_devconf/features/films/pages/description_item.dart';

import '../../common/enums/star_wars_entity.dart';
import '../../ui/theme/spacing.dart';
import '../../ui/ui.dart';
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
      appBar: AppBar(),
      extendBodyBehindAppBar: true,
      body: BlocBuilder<CharacterCubit, CharacterState>(
        builder: (context, state) {
          if (state is CharacterLoadedState) {
            return _body(state);
          }
          if (state is CharacterNotFoundState) {
            return _characterNotFound();
          }
          return const LoadingIndicator();
        },
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
          label: 'Birth year:',
          value: character.birthYear,
        ),
        Spacing.height8,
        DescriptionItem(
          label: 'Eye color:',
          value: character.eyeColor,
        ),
        Spacing.height8,
        DescriptionItem(
          label: 'Hair color:',
          value: character.hairColor,
        ),
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
