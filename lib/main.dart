import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hci_app/src/core/analytics/analytics_service.dart';
import 'package:hci_app/src/core/analytics/background_sync.dart';
import 'package:hci_app/src/core/router/app_router.dart';
import 'package:hci_app/src/core/theme/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:hci_app/src/features/models/cart_model.dart';
import 'package:hci_app/src/features/models/order_history_model.dart';
import 'package:hci_app/src/features/accessibility/accessibility_provider.dart';
import 'package:hci_app/generated/app_localizations.dart';

final routeObserver = RouteObserver<ModalRoute<void>>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AnalyticsService.instance.init();
  await initializeBackgroundSync();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartModel()),
        ChangeNotifierProvider(create: (context) => AccessibilityProvider()),
        ChangeNotifierProvider(create: (context) => OrderHistoryModel()),
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
          routeInformationParser: router.routeInformationParser,
          routerDelegate: router.routerDelegate,
        );
      },
    );
  }
}
