import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_mvp_s1/main.dart';

void main() {
  testWidgets('Test 1', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MainApplication());
  });
}
