// Place your solutions here!
import 'dart:async';

import 'package:exercise_e5/infrastructure/book_repository.dart';

import 'infrastructure/book.dart';

// PART 1

Future<void> longOperation() async{
  await Future.delayed(Duration(seconds: 3));
}

Future<void> sleepMilliseconds(int ms) async{
  await Future.delayed(Duration(milliseconds: ms));
}

Future<int> readTemperature() async{
  var degrees = await fetchDegree();
  return degrees;
}

Future<int> fetchDegree() => Future.delayed(Duration(milliseconds: 200),() => 23);

// PART 2

class BookService{
  BookService._();
  static final instance = BookService._();

  static BookService getInstance(){
    return instance;
  }

  Stream<Book> getBooks(){
    return BookRepository.getInstance().fetchAllBooks();
  }

  Stream<String> getAllTitles() async*{
    final controller = StreamController<String>();

    Stream<Book> stream = getBooks();
    await for(final value in stream){
      controller.add(value.title);
    }
    controller.close();
    yield* controller.stream;
  }

  /*
  Stream<Book> searchByTitle(String searchString) async*{
    final controller = StreamController<Book>();

    Stream<Book> stream = getBooks();
    await for(final value in stream){
      if(value.title == searchString){
        print(value.title);

        controller.add(value);
      }
    }
    controller.close();
    yield* controller.stream;
  }
   */


  Stream<Book> searchByTitle(String searchString) async* {
    var bookStreamController = StreamController<Book>();
    Stream<Book> bookStream = getBooks();
    await for (final book in bookStream) {
      if(book.title == searchString){
        bookStreamController.add(book);
      }
    }
    yield* bookStreamController.stream;
  }

  void countBooks(void Function(int) callback){
    // didn't figure this one out, but its a bonus i guess.
  }
}

