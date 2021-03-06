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
      body: BodyContainer(
        child: CustomScrollView(
          slivers: [
            DefaultAppBar(
              expandedHeight: 180,
              title: Text.rich(
                const TextSpan(
                  children: [
                    TextSpan(text: 'STAR', style: TextStyle(fontWeight: FontWeight.w900)),
                    TextSpan(text: 'WARS', style: TextStyle(fontWeight: FontWeight.w200)),
                  ],
                ),
                style: context.theme.textTheme.headline5,
              ),
            ),
            SliverSpacing.height16,
            // #DeclarativeUI - BlocBuilder<FilmsCubit, FilmsState>
            BlocBuilder<FilmsCubit, FilmsState>(
              buildWhen: defaultBlocCondition<FilmsState>(),
              builder: (context, state) {
                return SliverAnimatedSwitcher(
                  duration: const Duration(milliseconds: 600),
                  child: state is FilmsLoadedState
                      ? _body(state)
                      : const SliverToBoxAdapter(
                          child: LoadingIndicator(),
                        ),
                );
              },
            ),
            const SliverFillRemaining(
              child: SafeArea(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: Insets.vertical8,
                    child: Text(
                      'Powered by SWAPI',
                      style: TextStyle(color: ThemeColors.textColor),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
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
