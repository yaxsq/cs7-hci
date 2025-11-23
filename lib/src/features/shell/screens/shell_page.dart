import 'package:flutter/material.dart';
import 'package:hci_app/src/core/widgets/custom_bottom_nav_bar.dart';
import 'package:hci_app/src/features/landing/screens/landing_page.dart';
import 'package:hci_app/src/features/categories/screens/categories_page.dart';
import 'package:hci_app/src/features/search/screens/search_page.dart';
import 'package:hci_app/src/features/cart/screens/cart_page.dart';
import 'package:hci_app/src/features/account/screens/account_page.dart';

class ShellPage extends StatefulWidget {
  const ShellPage({super.key});

  @override
  State<ShellPage> createState() => _ShellPageState();
}

class _ShellPageState extends State<ShellPage> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    LandingPage(),
    SearchPage(),
    CartPage(),
    AccountPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
