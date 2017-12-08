import 'dart:io';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Main UI', () {
    FlutterDriver driver;

    setUpAll(() async {
      // Connects to the app.
      driver = await FlutterDriver.connect();

      // Create screenshots directory.
      new Directory('screenshots').create();
    });

    tearDownAll(() async {
      if (driver != null) {
        // Closes the connection.
        driver.close();
      }
    });

    test('Grab screenshots', () async {
      await grabScreenshot(driver, 'screenshots/home.png');

      await driver.tap(find.text('tab3'));
      await grabScreenshot(driver, 'screenshots/tab3.png');

      await driver.tap(find.text('tab2'));
      await driver.tap(find.byType('RaisedButton'));
      await driver.tap(find.byType('RaisedButton'));
      await driver.tap(find.byType('RaisedButton'));
      await grabScreenshot(driver, 'screenshots/tab2.png');
    });
  });
}

grabScreenshot(FlutterDriver driver, String filePath) async {
  final List<int> pixels = await driver.screenshot();
  final File file = new File(filePath);
  await file.writeAsBytes(pixels);
  print('wrote $file');
}