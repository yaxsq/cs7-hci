import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class AccessibilityProvider with ChangeNotifier {
  bool _largeFont = false;
  bool _highContrast = false;
  bool _voiceNarrator = false;
  Locale _locale = const Locale('en');
  bool _isUrdu = false;

  final FlutterTts _flutterTts = FlutterTts();

  AccessibilityProvider() {
    _flutterTts.setLanguage(_locale.languageCode);
  }

  bool get largeFont => _largeFont;
  bool get highContrast => _highContrast;
  bool get voiceNarrator => _voiceNarrator;
  Locale get locale => _locale;
  bool get isUrdu => _isUrdu;

  Future<void> speak(String text) async {
    if (_voiceNarrator) {
      await _flutterTts.speak(text);
    }
  }

  Future<void> stop() async {
    await _flutterTts.stop();
  }

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
    if (_voiceNarrator) {
      speak('Voice narrator enabled');
    } else {
      stop();
    }
    notifyListeners();
  }

  void toggleUrdu() {
    _isUrdu = !_isUrdu;
    _locale = _isUrdu ? const Locale('ur') : const Locale('en');
    _flutterTts.setLanguage(_locale.languageCode);
    notifyListeners();
  }
}
