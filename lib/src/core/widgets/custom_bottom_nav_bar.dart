import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: const BoxDecoration(
        color: Color(0xFF1E1E1E), // Dark grey background
        border: Border(
          top: BorderSide(
            color: Color(0xFF2C2C2C), // Top border color
            width: 1.0,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(Icons.home, "Home", 0),
          _buildNavItem(Icons.search, "Browse", 1),
          _buildNavItem(Icons.shopping_cart, "Cart", 2),
          _buildNavItem(Icons.person, "Account", 3),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    final bool isSelected = index == widget.selectedIndex;
    return Expanded(
      child: InkWell(
        onTap: () => widget.onItemTapped(index),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isSelected ? const Color(0xFF4CAF50) : const Color(0xFFBDBDBD),
              size: 24,
            ),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? const Color(0xFF4CAF50) : const Color(0xFFBDBDBD),
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
