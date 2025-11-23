import 'package:flutter/material.dart';
import 'package:hci_app/src/core/theme/app_theme.dart';
import 'package:hci_app/src/features/accessibility/providers/accessibility_provider.dart';
import 'package:hci_app/src/features/splash/screens/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:hci_app/src/features/models/cart_model.dart';
import 'package:hci_app/src/features/accessibility/screens/accessibility_options_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartModel()),
        ChangeNotifierProvider(create: (context) => AccessibilityProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AccessibilityProvider>(
      builder: (context, accessibilityProvider, child) {
        return MaterialApp(
          title: 'KraveMart',
          theme: (accessibilityProvider.isHighContrast
              ? AppTheme.highContrastTheme
              : AppTheme.lightTheme)
              .copyWith(
            textTheme: accessibilityProvider.isLargeFont
                ? AppTheme.largeTextTheme
                : AppTheme.lightTheme.textTheme,
          ),
          themeMode: ThemeMode.light,
          home: AccessibilityOptionsScreen(),
        );
      },
    );
  }
}
