import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:product_app/main.dart';
void main() {
  testWidgets('Product List Page loads successfully', (WidgetTester tester) async {
    // Build the ProductListPage and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that the "Products" title is displayed.
    expect(find.text('Products'), findsOneWidget);
  });
}