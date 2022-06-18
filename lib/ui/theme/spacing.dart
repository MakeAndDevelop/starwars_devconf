import 'package:flutter/widgets.dart';

import 'insets.dart';

/// Utility class containing const [SizedBox]es to use in [Row]s or [Column]s
/// to space items
class Spacing {
  static const SizedBox height4 = SizedBox(height: Insets.inset4);
  static const SizedBox height8 = SizedBox(height: Insets.inset8);
  static const SizedBox height16 = SizedBox(height: Insets.inset16);
  static const SizedBox height24 = SizedBox(height: Insets.inset24);
  static const SizedBox height32 = SizedBox(height: Insets.inset32);
  static const SizedBox height40 = SizedBox(height: Insets.inset32);

  static const SizedBox width4 = SizedBox(width: Insets.inset4);
  static const SizedBox width8 = SizedBox(width: Insets.inset8);
  static const SizedBox width16 = SizedBox(width: Insets.inset16);
  static const SizedBox width24 = SizedBox(width: Insets.inset24);
  static const SizedBox width32 = SizedBox(width: Insets.inset32);
}

class SliverSpacing {
  static const Widget height4 = SliverToBoxAdapter(child: SizedBox(height: Insets.inset4));
  static const Widget height8 = SliverToBoxAdapter(child: SizedBox(height: Insets.inset8));
  static const Widget height16 = SliverToBoxAdapter(child: SizedBox(height: Insets.inset16));
  static const Widget height24 = SliverToBoxAdapter(child: SizedBox(height: Insets.inset24));
  static const Widget height32 = SliverToBoxAdapter(child: SizedBox(height: Insets.inset32));
  static const Widget height40 = SliverToBoxAdapter(child: SizedBox(height: Insets.inset32));
  static const Widget width4 = SliverToBoxAdapter(child: SizedBox(width: Insets.inset4));
  static const Widget width8 = SliverToBoxAdapter(child: SizedBox(width: Insets.inset8));
  static const Widget width16 = SliverToBoxAdapter(child: SizedBox(width: Insets.inset16));
  static const Widget width24 = SliverToBoxAdapter(child: SizedBox(width: Insets.inset24));
  static const Widget width32 = SliverToBoxAdapter(child: SizedBox(width: Insets.inset32));
}
