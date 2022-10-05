import 'package:exercise_e5/infrastructure/book_repository.dart';
import 'package:exercise_e5/solutions.dart';
import 'package:test/test.dart';

void main() {
  test('Step 6: Book titles', () async {
    Stream<String> bookTitleStream = BookService.getInstance().getAllTitles();
    List<String> receivedTitles = [];
    await for (String title in bookTitleStream) {
      receivedTitles.add(title);
    }
    Iterable<String> expectedTitles = staticBookStorage.map((book) => book.title);
    expect(receivedTitles, equals(expectedTitles));
  });
}
