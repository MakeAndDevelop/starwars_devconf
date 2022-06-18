import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../../../common/utils/state_comparer.dart';
import '../../../ui/ui.dart';
import '../../features.dart';

class FilmsPage extends StatelessWidget {
  const FilmsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: true,
            elevation: 4,
            expandedHeight: 200,
            backgroundColor: context.theme.backgroundColor,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text(
                'Star Wars Episodes',
                style: TextStyle(color: ThemeColors.yellow),
              ),
              background: Image.network(
                'https://static.wikia.nocookie.net/starwars/images/c/cc/Star-wars-logo-new-tall.jpg/revision/latest?cb=20190313021755',
                fit: BoxFit.cover,
              ),
            ),
          ),
          BlocBuilder<FilmsCubit, FilmsState>(
            buildWhen: defaultBlocCondition<FilmsState>(),
            builder: (context, state) {
              return SliverAnimatedSwitcher(
                duration: const Duration(milliseconds: 600),
                child: state is FilmsLoadedState ? _body(state) : const SliverFillRemaining(child: LoadingIndicator()),
              );
            },
          ),
          const SliverFillRemaining(
            child: SafeArea(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  'Powered by SWAPI',
                  style: TextStyle(color: ThemeColors.yellow),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _body(FilmsLoadedState state) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => FilmListItem(film: state.films[index]),
        childCount: state.films.length,
      ),
    );
  }
}
