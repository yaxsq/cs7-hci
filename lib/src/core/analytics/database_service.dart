
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'event_model.dart';

class DatabaseService {
  Database? _database;

  Future<void> init() async {
    _database = await openDatabase(
      join(await getDatabasesPath(), 'analytics_events.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE events(id TEXT PRIMARY KEY, event_name TEXT, event_parameters TEXT, device_id TEXT, session_id TEXT, timestamp TEXT)',
        );
      },
      version: 1,
    );
  }

  Future<void> addEvent(AnalyticsEvent event) async {
    await _database?.insert(
      'events',
      event.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<AnalyticsEvent>> getEvents(int batchSize) async {
    final List<Map<String, dynamic>>? maps = await _database?.query(
      'events',
      limit: batchSize,
    );
    if (maps == null) {
      return [];
    }
    return List.generate(maps.length, (i) {
      return AnalyticsEvent.fromMap(maps[i]);
    });
  }

  Future<void> deleteEvents(List<String> eventIds) async {
    if (eventIds.isEmpty) {
      return;
    }
    final batch = _database?.batch();
    for (final id in eventIds) {
      batch?.delete('events', where: 'id = ?', whereArgs: [id]);
    }
    await batch?.commit();
  }
}
