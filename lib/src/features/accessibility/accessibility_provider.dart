import 'package:flutter/material.dart';
import 'package:hci_app/src/core/analytics/analytics_service.dart';

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
    AnalyticsService.instance.logEvent(
      'toggle_large_font',
      parameters: {'enabled': _largeFont},
    );
    notifyListeners();
  }

  void toggleHighContrast() {
    _highContrast = !_highContrast;
    AnalyticsService.instance.logEvent(
      'toggle_high_contrast',
      parameters: {'enabled': _highContrast},
    );
    notifyListeners();
  }

  void toggleVoiceNarrator() {
    _voiceNarrator = !_voiceNarrator;
    AnalyticsService.instance.logEvent(
      'toggle_voice_narrator',
      parameters: {'enabled': _voiceNarrator},
    );
    notifyListeners();
  }

  void toggleUrdu() {
    _isUrdu = !_isUrdu;
    _locale = _isUrdu ? const Locale('ur') : const Locale('en');
    AnalyticsService.instance.logEvent(
      'switch_language',
      parameters: {'language': _locale.languageCode},
    );
    notifyListeners();
  }
}
