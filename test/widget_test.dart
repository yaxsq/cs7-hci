import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hci_app/src/features/accessibility/providers/accessibility_provider.dart';
import 'package:hci_app/src/features/accessibility/screens/accessibility_options_screen.dart';
import 'package:hci_app/src/features/models/cart_model.dart';
import 'package:hci_app/main.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('Accessibility options screen smoke test',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => CartModel()),
          ChangeNotifierProvider(create: (context) => AccessibilityProvider()),
        ],
        child: const MyApp(),
      ),
    );

    // Verify that the AccessibilityOptionsScreen is displayed.
    expect(find.byType(AccessibilityOptionsScreen), findsOneWidget);
  });
}
