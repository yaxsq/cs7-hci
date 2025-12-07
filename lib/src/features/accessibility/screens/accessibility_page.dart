import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:hci_app/src/features/accessibility/accessibility_provider.dart';
import 'package:hci_app/generated/app_localizations.dart';

class AccessibilityPage extends StatelessWidget {
  const AccessibilityPage({super.key});

  @override
  Widget build(BuildContext context) {
    final accessibilityProvider = Provider.of<AccessibilityProvider>(context);
    final theme = Theme.of(context);
    final localizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.accessibilityMenu),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SwitchListTile(
              title: Text(localizations.largerFont, style: theme.textTheme.titleMedium),
              value: accessibilityProvider.largeFont,
              onChanged: (value) {
                accessibilityProvider.toggleLargeFont();
              },
              activeColor: theme.colorScheme.tertiary,
            ),
            SwitchListTile(
              title: Text(localizations.highContrast, style: theme.textTheme.titleMedium),
              value: accessibilityProvider.highContrast,
              onChanged: (value) {
                accessibilityProvider.toggleHighContrast();
              },
              activeColor: theme.colorScheme.tertiary,
            ),
            SwitchListTile(
              title: Text(localizations.narrator, style: theme.textTheme.titleMedium),
              value: accessibilityProvider.voiceNarrator,
              onChanged: (value) {
                accessibilityProvider.toggleVoiceNarrator();
              },
              activeColor: theme.colorScheme.tertiary,
            ),
            SwitchListTile(
              title: Text('اردو', style: theme.textTheme.titleMedium), // Changed here
              value: accessibilityProvider.isUrdu,
              onChanged: (value) {
                accessibilityProvider.toggleUrdu();
              },
              activeColor: theme.colorScheme.tertiary,
            ),
            const Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: theme.colorScheme.tertiary,
                foregroundColor: theme.colorScheme.onPrimary,
              ),
              onPressed: () {
                GoRouter.of(context).go('/account-setup');
              },
              child: Text(localizations.continueButton),
            ),
          ],
        ),
      ),
    );
  }
}
