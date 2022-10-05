// Here you have the functions provided in the start
// You should NOT change anything in this file during the exercise!

/// Represents an immutable book
class Book {
  final String author;
  final String title;

  const Book(this.author, this.title);

  @override
  String toString() {
    return "'$title' by $author";
  }
}
