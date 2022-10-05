import 'dart:io';
import 'package:exercise_e5/book_app.dart';

import 'package:golden_toolkit/golden_toolkit.dart';

/// Generate a "screenshot" of the main page, compare it with a given reference
/// "golden image". The test passes if the screen is the same as in the
/// "golden image"
void main() {
  testGoldens('Compare with golden image', (tester) async {
    final builder = DeviceBuilder();
    builder.overrideDevicesForAllScenarios(devices: [Device.phone]);
    builder.addScenario(widget: BookApp(), name: 'default page');
    await tester.pumpDeviceBuilder(builder);
    String goldenImageName;
    if (Platform.isWindows) {
      goldenImageName = "demo_page_windows";
    } else if (Platform.isLinux) {
      goldenImageName = "demo_page_linux";
    } else if (Platform.isMacOS) {
      goldenImageName = "demo_page_macos";
    } else {
      throw UnimplementedError(
          "Golden image testing not supported on your Operating system!");
    }
    print("Using $goldenImageName as a golden image");
    await screenMatchesGolden(tester, goldenImageName);
  });
}
