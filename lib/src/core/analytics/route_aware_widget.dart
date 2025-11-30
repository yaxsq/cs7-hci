import 'package:flutter/material.dart';
import 'package:hci_app/main.dart';
import 'package:hci_app/src/core/analytics/analytics_service.dart';

class RouteAwareWidget extends StatefulWidget {
  final Widget child;
  final String screenName;

  const RouteAwareWidget({
    super.key,
    required this.child,
    required this.screenName,
  });

  @override
  State<RouteAwareWidget> createState() => _RouteAwareWidgetState();
}

class _RouteAwareWidgetState extends State<RouteAwareWidget> with RouteAware {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPush() {
    _logScreenView();
  }

  @override
  void didPopNext() {
    _logScreenView();
  }

  void _logScreenView() {
    AnalyticsService.instance.logEvent(
      'view_screen',
      parameters: {'screen_name': widget.screenName},
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
