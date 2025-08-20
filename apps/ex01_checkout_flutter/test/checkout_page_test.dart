import 'package:flutter_test/flutter_test.dart';
import 'package:ex01_checkout_flutter/checkout_page.dart';
import 'package:flutter/material.dart';

void main() {
  testWidgets('CheckoutPage has input fields and buttons', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: CheckoutPage()));

    expect(find.byType(TextField), findsNWidgets(2));
    expect(find.text('Start Checkout'), findsOneWidget);
    expect(find.text('Verify Payment'), findsOneWidget);
  });
}
