
import 'package:uuid/uuid.dart';

class AnalyticsEvent {
  final String id;
  final String eventName;
  final Map<String, dynamic>? eventParameters;
  final String? deviceId;
  final String? sessionId;
  final DateTime timestamp;

  AnalyticsEvent({
    required this.eventName,
    this.eventParameters,
    this.deviceId,
    this.sessionId,
  })  : id = Uuid().v4(),
        timestamp = DateTime.now();

  AnalyticsEvent.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        eventName = map['event_name'],
        eventParameters = map['event_parameters'],
        deviceId = map['device_id'],
        sessionId = map['session_id'],
        timestamp = DateTime.parse(map['timestamp']);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'event_name': eventName,
      'event_parameters': eventParameters,
      'device_id': deviceId,
      'session_id': sessionId,
      'timestamp': timestamp.toIso8601String(),
    };
  }
}
