import 'package:exercise_e5/infrastructure/book.dart';
import 'package:exercise_e5/infrastructure/book_repository.dart';
import 'package:exercise_e5/infrastructure/sleep.dart';
import 'package:test/test.dart';
import 'test_utilities.dart';

void main() {
  test('Internal: Sleep', () async {
    const int sleepDuration = 2;
    final int timeBeforeSleepMs = getSystemTimeMs();
    await sleepSeconds(sleepDuration);
    final int timeAfterSleepMs = getSystemTimeMs();
    final double sleptSeconds =
        timeDifferenceMs(timeBeforeSleepMs, timeAfterSleepMs);
    expect(sleptSeconds, closeTo(sleepDuration, 0.1));
  });
  test('Internal: fetching all books at once', () async {
    Stream<List<Book>> bookStream =
        BookRepository.getInstance().fetchAllBooksAsAList();
    List<Book> allBooks = await bookStream.first;
    expect(allBooks, equals(staticBookStorage));
  });
}
