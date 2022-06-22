import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../../../ui/ui.dart';
import '../films.dart';

class OpeningCrawlSliver extends StatefulWidget {
  final Film film;

  const OpeningCrawlSliver({Key? key, required this.film}) : super(key: key);

  @override
  State<OpeningCrawlSliver> createState() => _OpeningCrawlSliverState();
}

class _OpeningCrawlSliverState extends State<OpeningCrawlSliver> {
  bool _showOpeningCrawl = false;
  Film get _film => widget.film;

  @override
  Widget build(BuildContext context) {
    return MultiSliver(
      children: [
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
              onPressed: () => setState(
                () => _showOpeningCrawl = !_showOpeningCrawl,
              ),
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
      ],
    );
  }
}
