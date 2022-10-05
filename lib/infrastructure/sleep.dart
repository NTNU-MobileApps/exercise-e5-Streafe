// Here you have the functions provided in the start
// You should NOT change anything in this file during the exercise!

import 'dart:async';

/// Sleep for sec seconds
Future<void> sleepSeconds(int sec) async {
  await Future.delayed(Duration(seconds: sec));
}

