import 'package:flutter/material.dart';
import 'package:hci_app/src/core/theme/app_theme.dart';
import 'package:hci_app/src/features/shell/screens/shell_page.dart';
import 'package:provider/provider.dart';
import 'package:hci_app/src/features/models/cart_model.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KraveMart',
      theme: AppTheme.lightTheme,
      home: const ShellPage(),
    );
  }
}
