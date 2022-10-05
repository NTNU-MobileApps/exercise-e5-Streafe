// Utility functions handy for tests

/// Calculate difference between millisecond-timestamps t1 and t2 (t2 - t1)
/// returns the difference in seconds
double timeDifferenceMs(int t1, int t2) {
  return (t2 - t1) / 1000.0;
}

/// Get system timestamp, in milliseconds
int getSystemTimeMs() {
  return DateTime.now().millisecondsSinceEpoch;
}

