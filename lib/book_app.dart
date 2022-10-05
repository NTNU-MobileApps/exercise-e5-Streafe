import 'dart:async';

import 'package:exercise_e5/infrastructure/book_repository.dart';
import 'package:exercise_e5/solutions.dart';
import 'package:flutter/material.dart';

import 'infrastructure/book.dart';

BookService bookService = BookService.getInstance();
BookRepository bookRepo = BookRepository.getInstance();
late final Stream<String> _books = bookService.getAllTitles();

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
              StreamBuilder<String>(
                stream: _books,
                builder: (context,snapshot) {
                  List<Widget> children;
                  if(snapshot.hasError){
                    children = <Widget>[
                      const Text("Error"),
                    ];
                  }else{
                    children = <Widget>[];
                    Stream<Book> list = bookRepo.fetchAllBooks();
                    list.forEach((element) {
                      children.add(BookItem(element));
                    }); // Why is this not working?
                    children.add(BookItem(kuroseBook));
                    children.add(BookItem(robbinsBook));
                    children.add(BookItem(spectorBook));

                  }
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: children,
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

// Not in use
List<Widget> getWidgets(){
  List<Widget> list = <Widget>[];
  Stream<Book> listS = bookRepo.fetchAllBooks();
  listS.forEach((element) {
    list.add(BookItem(element));
  });
  return list;
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

