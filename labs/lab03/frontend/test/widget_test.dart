// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:lab03_frontend/main.dart';

void main() {
  testWidgets('Chat app loads correctly', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our chat app loads with the correct title.
    expect(find.text('REST API Chat'), findsOneWidget);
    
    // Verify that username and message input fields are present.
    expect(find.byType(TextField), findsAtLeastNWidgets(2));
    
    // Verify that the send button is present.
    expect(find.text('Send'), findsOneWidget);
  });
}
