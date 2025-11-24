import 'package:flutter/material.dart';
import 'package:hci_app/src/core/router/app_router.dart';
import 'package:hci_app/src/core/theme/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:hci_app/src/features/models/cart_model.dart';
import 'package:hci_app/src/features/models/order_history_model.dart';
import 'package:hci_app/src/features/accessibility/accessibility_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartModel()),
        ChangeNotifierProvider(create: (context) => OrderHistoryModel()),
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
        return MaterialApp.router(
          title: 'KraveMart',
          theme: accessibilityProvider.highContrast
              ? AppTheme.highContrastTheme
              : (accessibilityProvider.largeFont
                  ? AppTheme.largeFontTheme
                  : AppTheme.lightTheme),
          routerConfig: router,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
