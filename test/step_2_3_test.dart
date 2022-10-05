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

/// Count the number of books - initiate counting, call the onCounted
/// callback when counting is done
void countBooks() {
  BookService.getInstance().countBooks(onCounted);
}

/// Called when the counting is done, check the final numbers
void onCounted(count) {
  expect(count, equals(staticBookStorage.length));
}
