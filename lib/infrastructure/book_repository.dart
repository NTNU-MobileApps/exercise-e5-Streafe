// Here you have the functions provided in the start
// You should NOT change anything in this file during the exercise!

import 'dart:async';

import 'book.dart';

/// Represents a repository class having access to a simulated book-database
class BookRepository {
  static final BookRepository _instance = BookRepository._();

  /// Get a singleton instance of the repository
  static BookRepository getInstance() {
    return _instance;
  }

  BookRepository._();

  /// Read all books from the database
  Stream<Book> fetchAllBooks() {
    final controller = StreamController<Book>();
    for (var book in staticBookStorage) {
      controller.add(book);
    }
    controller.close(); // Make sure we mark an end to the stream
    return controller.stream;
  }

  /// Fetch all the books as a stream containing all the books as a single
  /// object (the object itself is a list with all the books)
  Stream<List<Book>> fetchAllBooksAsAList() {
    final controller = StreamController<List<Book>>();
    controller.add(staticBookStorage);
    controller.close(); // Make sure we mark an end to the stream
    return controller.stream;
  }
}

// Static dummy books in the database
const kuroseBook = Book("Jim Kurose", "Computer networks");
const robbinsBook = Book("Jennifer Niederst Robbins", "Learning Web Design");
const spectorBook = Book("Ian Spector", "The Truth About Chuck Norris");

const staticBookStorage = [kuroseBook, robbinsBook, spectorBook];
