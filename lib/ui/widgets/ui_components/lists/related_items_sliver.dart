import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../../../../common/common.dart';
import '../../../ui.dart';

class RelatedItemsSliver extends StatelessWidget {
  final String title;
  final StarWarsType type;
  final List<String> items;

  const RelatedItemsSliver({
    Key? key,
    required this.title,
    required this.type,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return const SliverToBoxAdapter();
    }
    return MultiSliver(
      children: [
        SliverContainer(
          padding: Insets.ltr16,
          child: Text(
            title,
            style: context.textTheme.headline6,
          ),
        ),
        SliverToBoxAdapter(
          child: HorizontalImageList(
            items: items,
            type: type,
          ),
        ),
      ],
    );
  }
}
