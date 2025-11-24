import 'package:flutter/material.dart';

class AccessibilityProvider with ChangeNotifier {
  bool _largeFont = false;
  bool _highContrast = false;
  bool _voiceNarrator = false;

  bool get largeFont => _largeFont;
  bool get highContrast => _highContrast;
  bool get voiceNarrator => _voiceNarrator;

  void toggleLargeFont() {
    _largeFont = !_largeFont;
    notifyListeners();
  }

  void toggleHighContrast() {
    _highContrast = !_highContrast;
    notifyListeners();
  }

  void toggleVoiceNarrator() {
    _voiceNarrator = !_voiceNarrator;
    notifyListeners();
  }
}
