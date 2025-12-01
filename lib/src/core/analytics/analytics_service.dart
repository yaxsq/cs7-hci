
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'database_service.dart';
import 'event_model.dart';

class AnalyticsService with WidgetsBindingObserver {
  static final AnalyticsService _instance = AnalyticsService._internal();
  static AnalyticsService get instance => _instance;

  late final String _deviceId;
  late final String _sessionId;
  final DatabaseService _databaseService = DatabaseService();

  AnalyticsService._internal();

  Future<void> init() async {
    _deviceId = await _getDeviceId();
    _sessionId = Uuid().v4();
    await _databaseService.init();
    WidgetsBinding.instance.addObserver(this);
    logEvent('app_start');
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.resumed:
        logEvent('app_resume');
        break;
      case AppLifecycleState.paused:
        logEvent('app_pause');
        break;
      default:
        break;
    }
  }

  Future<String> _getDeviceId() async {
    // This is a placeholder. In a real app, you'd use a package like
    // device_info_plus to get a stable device ID.
    return Future.value('test-device-id');
  }

  void logTap(TapDownDetails details) {
    logEvent('tap', parameters: {
      'x': details.globalPosition.dx,
      'y': details.globalPosition.dy,
    });
  }

  void logEvent(String eventName, {Map<String, dynamic>? parameters}) {
    final event = AnalyticsEvent(
      eventName: eventName,
      eventParameters: parameters,
      deviceId: _deviceId,
      sessionId: _sessionId,
    );
    _databaseService.addEvent(event);
  }
}
