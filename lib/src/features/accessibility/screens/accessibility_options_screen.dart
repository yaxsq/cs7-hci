import 'package:flutter/material.dart';
import 'package:hci_app/src/features/splash/screens/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:hci_app/src/features/accessibility/providers/accessibility_provider.dart';

class AccessibilityOptionsScreen extends StatelessWidget {
  const AccessibilityOptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Accessibility Options'),
      ),
      body: Consumer<AccessibilityProvider>(
        builder: (context, accessibilityProvider, child) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Customize your experience:',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.white),
                ),
                const SizedBox(height: 20),
                SwitchListTile(
                  title: const Text('Larger Font', style: TextStyle(color: Colors.white)),
                  value: accessibilityProvider.isLargeFont,
                  onChanged: (value) {
                    accessibilityProvider.setLargeFont(value);
                  },
                  activeColor: const Color(0xFF4CAF50),
                ),
                SwitchListTile(
                  title: const Text('High Contrast Mode', style: TextStyle(color: Colors.white)),
                  value: accessibilityProvider.isHighContrast,
                  onChanged: (value) {
                    accessibilityProvider.setHighContrast(value);
                  },
                  activeColor: const Color(0xFF4CAF50),
                ),
                SwitchListTile(
                  title: const Text('Voice Assisted Mode', style: TextStyle(color: Colors.white)),
                  value: accessibilityProvider.isNarratorMode,
                  onChanged: (value) {
                    accessibilityProvider.setNarratorMode(value);
                  },
                  activeColor: const Color(0xFF4CAF50),
                ),
                const Spacer(),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const SplashScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4CAF50),
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      textStyle: const TextStyle(fontSize: 18),
                    ),
                    child: const Text('Continue'),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}