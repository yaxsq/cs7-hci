import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hci_app/src/core/widgets/custom_bottom_nav_bar.dart';

class ShellPage extends StatelessWidget {
  final Widget child;
  final GoRouterState state;

  const ShellPage({super.key, required this.child, required this.state});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _calculateSelectedIndex(state.uri.toString()),
        onItemTapped: (index) => _onItemTapped(index, context),
      ),
    );
  }

  int _calculateSelectedIndex(String location) {
    if (location.startsWith('/categories')) {
      return 1;
    }
    if (location.startsWith('/cart')) {
      return 2;
    }
    if (location.startsWith('/account')) {
      return 3;
    }
    if (location.startsWith('/')) {
      return 0;
    }
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        GoRouter.of(context).go('/');
        break;
      case 1:
        GoRouter.of(context).go('/categories');
        break;
      case 2:
        GoRouter.of(context).go('/cart');
        break;
      case 3:
        GoRouter.of(context).go('/account');
        break;
    }
  }
}
