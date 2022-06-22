import 'package:flutter/material.dart';

import '../../../common/common.dart';
import '../../ui.dart';

class DefaultPage extends StatelessWidget {
  final String title;
  final String itemId;
  final StarWarsType type;

  const DefaultPage({
    Key? key,
    required this.itemId,
    required this.type,
    this.title = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyContainer(
        child: CustomScrollView(
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
                  MainImage(imageUrl: ImageUtility.imageFor(itemId, type)),
                  Expanded(
                    child: VerticalHeadline(title: title),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
