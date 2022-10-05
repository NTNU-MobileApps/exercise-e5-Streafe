import 'dart:async';

import 'package:golden_toolkit/golden_toolkit.dart';

// This is necessary for tests involving the golden image
Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  await loadAppFonts();
  return testMain();
}