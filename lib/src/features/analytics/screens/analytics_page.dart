import 'dart:io';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hci_app/src/core/analytics/database_service.dart';

class AnalyticsPage extends StatelessWidget {
  const AnalyticsPage({super.key});

  Future<void> _exportToCsv(BuildContext context) async {
    final databaseService = DatabaseService();
    await databaseService.init();
    final events = await databaseService.getEvents(1000);
    if (events.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No analytics events to export.')),
      );
      return;
    }

    final csvData = StringBuffer();
    csvData.writeln('eventName,eventParameters,deviceId,sessionId,timestamp');
    for (final event in events) {
      csvData.writeln(
          '"${event.eventName}","${event.eventParameters}","${event.deviceId}","${event.sessionId}","${event.timestamp}"');
    }

    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/analytics.csv');
      await file.writeAsString(csvData.toString());
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Exported to ${file.path}')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error exporting to CSV: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Analytics'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _exportToCsv(context),
              child: const Text('Export to CSV'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => GoRouter.of(context).go('/account/analytics/heatmap'),
              child: const Text('View Heatmap'),
            ),
          ],
        ),
      ),
    );
  }
}
