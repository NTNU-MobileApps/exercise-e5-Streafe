import 'package:exercise_e5/infrastructure/book.dart';
import 'package:exercise_e5/infrastructure/book_repository.dart';
import 'package:exercise_e5/solutions.dart';
import 'package:test/test.dart';

void main() {
  test('Step 7: Search books by title', () {
    searchBooks("r", staticBookStorage);
    searchBooks("", staticBookStorage);
    searchBooks("w", [kuroseBook]);
    searchBooks("W", [robbinsBook]);
    searchBooks("ut", [kuroseBook, spectorBook]);
    searchBooks("norris", []);
    searchBooks("Norris", [spectorBook]);
    searchBooks("The Truth About Chuck Norris", [spectorBook]);
  });
}

/// Simulate searching books with title including specific character
void searchBooks(String searchString, List<Book> expectedBooks) async {
  Stream<Book> bookStream = BookService.getInstance().searchByTitle(searchString);
  var receivedBooks = [];
  await for (final book in bookStream) {
    receivedBooks.add(book);
  }
  expect(receivedBooks, equals(expectedBooks));
}
