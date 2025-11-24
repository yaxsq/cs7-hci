import 'package:flutter/material.dart';

class AccessibilityProvider with ChangeNotifier {
  bool _largeFont = false;
  bool _highContrast = false;
  bool _voiceNarrator = false;
  Locale _locale = const Locale('en');
  bool _isUrdu = false;

  bool get largeFont => _largeFont;
  bool get highContrast => _highContrast;
  bool get voiceNarrator => _voiceNarrator;
  Locale get locale => _locale;
  bool get isUrdu => _isUrdu;

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

  void toggleUrdu() {
    _isUrdu = !_isUrdu;
    _locale = _isUrdu ? const Locale('ur') : const Locale('en');
    notifyListeners();
  }
}
