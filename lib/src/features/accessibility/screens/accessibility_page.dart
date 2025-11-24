import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:hci_app/src/features/accessibility/accessibility_provider.dart';

class AccessibilityPage extends StatelessWidget {
  const AccessibilityPage({super.key});

  @override
  Widget build(BuildContext context) {
    final accessibilityProvider = Provider.of<AccessibilityProvider>(context);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Accessibility Menu'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SwitchListTile(
              title: Text('Larger Font', style: theme.textTheme.titleMedium),
              value: accessibilityProvider.largeFont,
              onChanged: (value) {
                accessibilityProvider.toggleLargeFont();
              },
              activeColor: theme.colorScheme.tertiary,
            ),
            SwitchListTile(
              title: Text('High Contrast', style: theme.textTheme.titleMedium),
              value: accessibilityProvider.highContrast,
              onChanged: (value) {
                accessibilityProvider.toggleHighContrast();
              },
              activeColor: theme.colorScheme.tertiary,
            ),
            SwitchListTile(
              title: Text('Narrator', style: theme.textTheme.titleMedium),
              value: accessibilityProvider.voiceNarrator,
              onChanged: (value) {
                accessibilityProvider.toggleVoiceNarrator();
              },
              activeColor: theme.colorScheme.tertiary,
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                GoRouter.of(context).go('/');
              },
              child: const Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }
}
