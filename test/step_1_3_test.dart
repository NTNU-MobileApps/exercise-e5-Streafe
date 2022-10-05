import 'package:exercise_e5/solutions.dart';
import 'package:test/test.dart';

import 'test_utilities.dart';

/// Tests Part 1.3: the readTemperature() function
void main() {
  test('Step 3: Read temperature', () async {
    final int timeAtStart = getSystemTimeMs();
    int temp = await readTemperature();
    final int timeInTheEnd = getSystemTimeMs();
    final double duration = timeDifferenceMs(timeAtStart, timeInTheEnd);
    const expectedTempReadingDuration = 0.2;
    expect(duration, closeTo(expectedTempReadingDuration, 0.05));
    expect(temp, equals(23));
  });
}
