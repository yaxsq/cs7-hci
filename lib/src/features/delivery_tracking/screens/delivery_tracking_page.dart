import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hci_app/generated/app_localizations.dart';

class DeliveryTrackingPage extends StatelessWidget {
  const DeliveryTrackingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final localizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.trackMyOrder),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => GoRouter.of(context).go('/'), // Go back to home
        ),
      ),
      body: Stack(
        children: [
          Image.asset(
            'assets/images/maptrack.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
            top: 20,
            left: 0,
            right: 0,
            child: Text(
              localizations.orderOnItsWay,
              textAlign: TextAlign.center,
              style: theme.textTheme.headlineSmall,
            ),
          ),
        ],
      ),
    );
  }
}