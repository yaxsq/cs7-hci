
import 'package:workmanager/workmanager.dart';
import 'database_service.dart';

const analyticsTask = "analyticsTask";

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    if (task == analyticsTask) {
      final databaseService = DatabaseService();
      await databaseService.init();
      final events = await databaseService.getEvents(100);
      if (events.isNotEmpty) {
        // In a real app, you'd send the events to your backend here.
        // For this example, we'll just print them.
        print('--- Sending ${events.length} analytics events ---');
        for (final event in events) {
          print(event.toMap());
        }
        // Assuming the "send" was successful, delete the events.
        await databaseService.deleteEvents(events.map((e) => e.id).toList());
      }
    }
    return Future.value(true);
  });
}

Future<void> initializeBackgroundSync() async {
  await Workmanager().initialize(
    callbackDispatcher,
    isInDebugMode: true,
  );
  await Workmanager().registerPeriodicTask(
    "1",
    analyticsTask,
    frequency: Duration(minutes: 15),
  );
}
