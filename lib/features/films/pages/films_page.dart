import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../../../common/utils/state_comparer.dart';
import '../../../generated/assets.dart';
import '../../../ui/theme/spacing.dart';
import '../../../ui/ui.dart';
import '../../features.dart';

class FilmsPage extends StatelessWidget {
  const FilmsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.dstATop),
              image: AssetImage(
                Assets.imagesBackgroundBlurred,
              ),
              fit: BoxFit.cover),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.black,
              Colors.brown[600]!,
            ],
          ),
        ),
        child: CustomScrollView(
          slivers: [
            const DefaultAppBar(),
            SliverSpacing.height16,
            BlocBuilder<FilmsCubit, FilmsState>(
              buildWhen: defaultBlocCondition<FilmsState>(),
              builder: (context, state) {
                return SliverAnimatedSwitcher(
                  duration: const Duration(milliseconds: 600),
                  child:
                      state is FilmsLoadedState ? _body(state) : const SliverFillRemaining(child: LoadingIndicator()),
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

class DefaultAppBar extends StatelessWidget {
  const DefaultAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      shadowColor: ThemeColors.shadowColor,
      floating: true,
      expandedHeight: 120,
      elevation: 1,
      forceElevated: true,
      flexibleSpace: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: ThemeColors.borderColor),
              ),
            ),
            child: FlexibleSpaceBar(
              centerTitle: true,
              title: Text.rich(
                const TextSpan(
                  children: [
                    TextSpan(text: 'STAR', style: TextStyle(fontWeight: FontWeight.w900)),
                    TextSpan(text: 'WARS', style: TextStyle(fontWeight: FontWeight.w100)),
                  ],
                ),
                style: context.theme.textTheme.headline5,
              ),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.transparent,
    );
  }
}
