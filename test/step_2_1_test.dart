import 'package:exercise_e5/solutions.dart';
import 'package:test/test.dart';

void main() {
  test('Step 4: Singleton BookService', () {
    expect(BookService.getInstance(), isA<BookService>());
  });
}
