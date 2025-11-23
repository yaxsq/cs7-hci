import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccessibilityProvider with ChangeNotifier {
  bool _isLargeFont = false;
  bool _isHighContrast = false;
  bool _isNarratorMode = false;

  bool get isLargeFont => _isLargeFont;
  bool get isHighContrast => _isHighContrast;
  bool get isNarratorMode => _isNarratorMode;

  AccessibilityProvider() {
    loadPreferences();
  }

  Future<void> loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    _isLargeFont = prefs.getBool('isLargeFont') ?? false;
    _isHighContrast = prefs.getBool('isHighContrast') ?? false;
    _isNarratorMode = prefs.getBool('isNarratorMode') ?? false;
    notifyListeners();
  }

  Future<void> setLargeFont(bool value) async {
    _isLargeFont = value;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLargeFont', value);
    notifyListeners();
  }

  Future<void> setHighContrast(bool value) async {
    _isHighContrast = value;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isHighContrast', value);
    notifyListeners();
  }

  Future<void> setNarratorMode(bool value) async {
    _isNarratorMode = value;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isNarratorMode', value);
    notifyListeners();
  }
}
