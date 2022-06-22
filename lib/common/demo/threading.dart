import 'package:flutter/foundation.dart';

/// Performs a slow/heavy task in the background (on a new isolate).
Future<int> computeExample() async {
  final sum = await compute(computationallyExpensiveTask, 1000000000);
  return sum;
}

int computationallyExpensiveTask(int value) {
  var sum = 0;
  for (var i = 0; i <= value; i++) {
    sum += i;
  }
  debugPrint('finished');
  return sum;
}
