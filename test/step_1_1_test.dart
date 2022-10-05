import 'package:exercise_e5/solutions.dart';
import 'package:test/test.dart';

import 'test_utilities.dart';

/// Tests Part 1.1: the longOperation() function
void main() {
  test('Step 1: Long operation', () async {
    await checkOperationTiming();
    await checkOperationTiming();
  });
}

Future<void> checkOperationTiming() async {
  final int timeBefore = getSystemTimeMs();
  await longOperation();
  final int timeAfter = getSystemTimeMs();
  const expectedLongOperationTime = 3.0;
  expect(timeDifferenceMs(timeBefore, timeAfter),
      closeTo(expectedLongOperationTime, 0.1));
}
