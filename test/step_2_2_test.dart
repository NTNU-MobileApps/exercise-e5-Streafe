import 'package:exercise_e5/infrastructure/book.dart';
import 'package:exercise_e5/infrastructure/book_repository.dart';
import 'package:exercise_e5/solutions.dart';
import 'package:test/test.dart';

void main() {
  test('Step 5: Get all books from service', () {
    fetchAllBooks();
    // Fetch all books twice to see if the stream is properly closed
    fetchAllBooks();
  });
}

/// Simulate fetching all books
void fetchAllBooks() async {
  Stream<Book> bookStream = BookService.getInstance().getBooks();
  final expectedBooks = [kuroseBook, robbinsBook, spectorBook];
  var receivedBooks = [];
  await for (final book in bookStream) {
    receivedBooks.add(book);
  }
  expect(receivedBooks, equals(expectedBooks));
}