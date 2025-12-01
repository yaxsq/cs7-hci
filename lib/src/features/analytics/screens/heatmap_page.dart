import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fl_heatmap/fl_heatmap.dart';
import 'package:hci_app/src/core/analytics/database_service.dart';
import 'package:image/image.dart' as img;

class HeatmapPage extends StatefulWidget {
  const HeatmapPage({super.key});

  @override
  State<HeatmapPage> createState() => _HeatmapPageState();
}

class _HeatmapPageState extends State<HeatmapPage> {
  img.Image? _backgroundImage;
  List<DataPoint> _heatmapData = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    await _loadImage();
    await _loadHeatmapData();
    setState(() {
      _isLoading = false;
    });
  }

  Future<void> _loadImage() async {
    final byteData = await rootBundle.load('assets/images/maptrack.png');
    final image = img.decodeImage(byteData.buffer.asUint8List());
    setState(() {
      _backgroundImage = image;
    });
  }

  Future<void> _loadHeatmapData() async {
    final databaseService = DatabaseService();
    await databaseService.init();
    final events = await databaseService.getEvents(1000);
    final tapEvents = events.where((e) => e.eventName == 'tap').toList();

    if (_backgroundImage == null) return;

    final data = tapEvents.map((e) {
      final params = e.eventParameters as Map<String, dynamic>;
      final dx = params['x'] as double;
      final dy = params['y'] as double;
      return DataPoint(dx / _backgroundImage!.width, dy / _backgroundImage!.height);
    }).toList();

    setState(() {
      _heatmapData = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Heatmap'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _backgroundImage == null
              ? const Center(child: Text('Error loading image.'))
              : Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset('assets/images/maptrack.png'),
                      if (_heatmapData.isNotEmpty)
                        Heatmap(
                          data: _heatmapData,
                          heatmapFactor: 0.5,
                          heatmapColor: Colors.red,
                          child: Container(),
                        ),
                    ],
                  ),
                ),
    );
  }
}
