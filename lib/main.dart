import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:hci_app/src/core/router/app_router.dart' as app_router;
import 'package:hci_app/src/core/theme/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:hci_app/src/features/models/cart_model.dart';
import 'package:hci_app/src/features/models/order_history_model.dart';
import 'package:hci_app/src/features/accessibility/accessibility_provider.dart';
import 'package:hci_app/generated/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final bool hasCompletedSetup = prefs.getBool('hasCompletedSetup') ?? false;

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartModel()),
        ChangeNotifierProvider(create: (context) => AccessibilityProvider()),
        ChangeNotifierProvider(create: (context) => OrderHistoryModel()),
      ],
      child: MyApp(hasCompletedSetup: hasCompletedSetup),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.hasCompletedSetup});

  final bool hasCompletedSetup;

  @override
  Widget build(BuildContext context) {
    final router = GoRouter(
      initialLocation: hasCompletedSetup ? '/splash' : '/accessibility',
      navigatorKey: app_router.rootNavigatorKey,
      routes: app_router.routes,
    );

    return Consumer<AccessibilityProvider>(
      builder: (context, accessibilityProvider, child) {
        return MaterialApp.router(
          title: 'KraveMart',
          theme: accessibilityProvider.highContrast && accessibilityProvider.largeFont
              ? AppTheme.highContrastLargeFontTheme
              : accessibilityProvider.highContrast
                  ? AppTheme.highContrastTheme
                  : accessibilityProvider.largeFont
                      ? AppTheme.largeFontTheme
                      : AppTheme.lightTheme,
          routerConfig: router,
          debugShowCheckedModeBanner: false,
          locale: accessibilityProvider.locale,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en'), // English
            Locale('ur'), // Urdu
          ],
        );
      },
    );
  }
}
