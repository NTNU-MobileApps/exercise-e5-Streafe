import 'package:exercise_e5/solutions.dart';
import 'package:test/test.dart';

import 'test_utilities.dart';

/// Tests Part 1.2: the sleepMilliseconds() function
void main() {
  test('Step 2: Millisecond sleep', () async {
    await testSleeping(300);
    await testSleeping(200);
  });
}

Future<void> testSleeping(int milliseconds) async {
  final int timeBefore = getSystemTimeMs();
  await sleepMilliseconds(milliseconds);
  final int timeAfter = getSystemTimeMs();
  expect(timeDifferenceMs(timeBefore, timeAfter),
      closeTo(milliseconds / 1000.0, 0.05));
}
