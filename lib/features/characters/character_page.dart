import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../../common/enums/star_wars_entity.dart';
import '../../common/utils/state_comparer.dart';
import '../../ui/ui.dart';
import 'bloc/bloc.dart';
import 'models/character.dart';

class CharacterPage extends StatefulWidget {
  final String characterId;

  const CharacterPage({Key? key, required this.characterId}) : super(key: key);

  @override
  State<CharacterPage> createState() => _CharacterPageState();
}

class _CharacterPageState extends State<CharacterPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CharacterCubit>(context).loadCharacter(widget.characterId);
  }

  @override
  Widget build(BuildContext context) {
    return BodyContainer(
      child: BlocBuilder<CharacterCubit, CharacterState>(
        buildWhen: defaultBlocCondition<CharacterState>(),
        builder: (_, state) {
          final title = state is CharacterLoadedState ? state.character.name : '';
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                title: Text(
                  title,
                  style: const TextStyle(color: ThemeColors.textColor),
                ),
              ),
              const SizedSliver(height: 40),
              SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MainImage(imageUrl: ImageUtility.imageFor(widget.characterId, StarWarsType.character)),
                    Expanded(
                      child: VerticalHeadline(title: title),
                    ),
                  ],
                ),
              ),
              SliverAnimatedSwitcher(
                duration: AnimationConstants.animationDuration,
                child: _body(state),
              ),
              const SizedSliver(height: 40),
            ],
          );
        },
      ),
    );
  }

  Widget _body(CharacterState state) {
    if (state is CharacterLoadedState) {
      return CharacterPageBody(character: state.character);
    }
    return const SliverLoadingIndicator();
  }
}

class CharacterPageBody extends StatelessWidget {
  final Character character;

  const CharacterPageBody({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiSliver(
      children: [
        CharacterDetails(
          character: character,
        ),
        RelatedItemsSliver(title: 'Films:', type: StarWarsType.film, items: character.films),
        RelatedItemsSliver(title: 'Starships:', type: StarWarsType.starship, items: character.starships),
        RelatedItemsSliver(title: 'Vehicles:', type: StarWarsType.starship, items: character.vehicles),
      ],
    );
  }
}

class CharacterDetails extends StatelessWidget {
  const CharacterDetails({
    Key? key,
    required this.character,
  }) : super(key: key);

  final Character character;

  @override
  Widget build(BuildContext context) {
    return SliverContainer(
      padding: const EdgeInsets.symmetric(
        vertical: Insets.inset16,
        horizontal: Insets.inset12,
      ),
      child: Wrap(
        children: [
          LabelBox(label: 'Name:', value: character.name),
          LabelBox(label: 'Height:', value: character.height),
          LabelBox(label: 'Mass:', value: character.mass),
          LabelBox(label: 'Hair color:', value: character.hairColor),
          LabelBox(label: 'Eye color:', value: character.eyeColor),
          LabelBox(label: 'Birth year:', value: character.birthYear),
        ],
      ),
    );
  }
}
