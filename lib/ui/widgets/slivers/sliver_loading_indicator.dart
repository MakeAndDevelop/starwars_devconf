import 'package:flutter/widgets.dart';
import '../loading_indicator.dart';

class SliverLoadingIndicator extends StatelessWidget {
  const SliverLoadingIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SliverFillRemaining(
      child: Center(
        child: LoadingIndicator(),
      ),
    );
  }
}
