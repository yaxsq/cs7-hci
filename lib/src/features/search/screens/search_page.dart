import 'package:flutter/material.dart';
import 'package:hci_app/src/core/widgets/custom_bottom_nav_bar.dart';
import 'package:hci_app/src/core/widgets/custom_text_field.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  int _selectedIndex = 1; // For bottom navigation bar

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Handle navigation to different pages based on index
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Search Results'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: CustomTextField(
              hintText: 'organic milk',
              prefixIcon: const Icon(Icons.search, color: Color(0xFFBDBDBD)),
              controller: TextEditingController(text: 'organic milk'),
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Showing 25 results',
                  style: TextStyle(color: Colors.white70),
                ),
                Row(
                  children: [
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.filter_list, color: Colors.white),
                      label: const Text('Filter', style: TextStyle(color: Colors.white)),
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.sort, color: Colors.white),
                      label: const Text('Sort', style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          _buildSearchResultItem(
            imageUrl: 'https://www.figma.com/api/mcp/asset/a61aaf82-3192-4f8a-9f02-6d195d487fef',
            title: 'Horizon Organic Whole Milk',
            subtitle: 'Half Gallon',
            price: '.99',
          ),
          _buildSearchResultItem(
            imageUrl: 'https://www.figma.com/api/mcp/asset/a61aaf82-3192-4f8a-9f02-6d195d487fef',
            title: 'Stonyfield Organic Whole Milk',
            subtitle: 'Half Gallon',
            price: '.99',
          ),
          _buildSearchResultItem(
            imageUrl: 'https://www.figma.com/api/mcp/asset/a61aaf82-3192-4f8a-9f02-6d195d487fef',
            title: 'Maple Hill Grass-Fed Whole Milk',
            subtitle: 'Half Gallon',
            price: '.99',
          ),
          _buildSearchResultItem(
            imageUrl: 'https://www.figma.com/api/mcp/asset/a61aaf82-3192-4f8a-9f02-6d195d487fef',
            title: 'Clover Sonoma Organic',
            subtitle: 'Half Gallon',
            price: '.99',
          ),
          const SizedBox(height: 20),
          Center(
            child: TextButton(
              onPressed: () {},
              child: const Text('Show More', style: TextStyle(color: Color(0xFF4CAF50))),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }

  Widget _buildSearchResultItem({
    required String imageUrl,
    required String title,
    required String subtitle,
    required String price,
  }) {
    return Card(
      color: const Color(0xFF1E1E1E),
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Image.network(
              imageUrl,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text(subtitle, style: const TextStyle(color: Colors.white70)),
                  const SizedBox(height: 8),
                  Text(price, style: const TextStyle(color: Color(0xFFAADD78), fontSize: 16)),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4CAF50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: const Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}
