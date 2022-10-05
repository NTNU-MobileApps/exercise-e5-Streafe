import 'package:exercise_e5/infrastructure/book_repository.dart';
import 'package:flutter/material.dart';

import 'infrastructure/book.dart';

void main() {
  runApp(BookApp());
}

/// An app showing books from a library (imaginary database)
// TODO - change this widget so that the BookItem widgets are
//  created based on the Book objects received from
//  the BookService.getBooks() stream!
class BookApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("Book app")),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              BookItem(spectorBook),
              BookItem(spectorBook),
              BookItem(spectorBook),
              BookItem(spectorBook)
            ],
          ),
        ),
      ),
    );
  }
}

/// A widget displaying a book as an item in a list
class BookItem extends StatelessWidget {
  final Book book;

  BookItem(this.book);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(child: Text(book.title)),
      ),
    );
  }
}
