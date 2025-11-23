import 'package:flutter/material.dart';
import 'package:hci_app/src/core/widgets/custom_text_field.dart';
import 'package:hci_app/src/core/widgets/category_chip.dart';
import 'package:hci_app/src/core/widgets/product_card.dart';
import 'package:hci_app/src/features/categories/screens/categories_page.dart';
import 'package:hci_app/src/features/models/product_model.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Product> weeklyDeals = [
      Product(id: '1', name: 'Organic Eggs', description: 'A dozen of our finest organic eggs.', price: 3.99, oldPrice: 4.99, imageUrl: 'https://www.figma.com/api/mcp/asset/fcee011d-f2e7-4102-88dc-41ed3590d413'),
      Product(id: '2', name: 'Sourdough Bread', description: 'Freshly baked sourdough bread.', price: 2.00, oldPrice: 3.50, imageUrl: 'https://www.figma.com/api/mcp/asset/d155d3cb-27c0-4b28-9fa8-9eb31478f7d8'),
      Product(id: '3', name: 'Organic Milk', description: 'Half gallon of our best organic milk.', price: 2.00, oldPrice: 2.99, imageUrl: 'https://www.figma.com/api/mcp/asset/ac3289d2-eb36-488b-99be-8cbe80edf9dd'),
      Product(id: '4', name: 'Cheddar Cheese', description: 'A block of sharp cheddar cheese.', price: 5.49, imageUrl: 'https://www.figma.com/api/mcp/asset/e995fb1e-3c29-4569-ba32-5e8560f12baf'),
    ];

    final List<Product> freshProduce = [
      Product(id: '5', name: 'Avocados', description: 'A bag of fresh avocados.', price: 1.99, imageUrl: 'https://www.figma.com/api/mcp/asset/4a12f1ee-dde5-4356-b95b-5485fed03e8c'),
      Product(id: '6', name: 'Bananas', description: 'A bunch of ripe bananas.', price: 0.59, imageUrl: 'https://www.figma.com/api/mcp/asset/4ce4eb8b-9704-4c00-9e64-4143bb4b88eb'),
      Product(id: '7', name: 'Strawberries', description: 'A pint of fresh strawberries.', price: 3.99, imageUrl: 'https://www.figma.com/api/mcp/asset/fca53eb9-b874-41d4-8a5c-2169645e8dfc'),
    ];

    return Scaffold(
      backgroundColor: Colors.black, // Assuming a dark background for the scaffold
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            expandedHeight: 200, // Height of the top section (DELIVER TO + Search)
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                padding: const EdgeInsets.all(16.0),
                color: const Color(0xFF1E1E1E), // Dark background for the app bar area
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 32), // Status bar padding
                    Text(
                      'DELIVER TO',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.white70),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.location_on, color: Colors.white, size: 20),
                        const SizedBox(width: 8),
                        Flexible(
                          child: Text(
                            '123 Main St, Anytown',
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const Icon(Icons.keyboard_arrow_down, color: Colors.white, size: 20),
                      ],
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      controller: _searchController,
                      hintText: 'Search for groceries',
                      prefixIcon: const Icon(Icons.search, color: Color(0xFFBDBDBD)),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Category Chips
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: SizedBox(
                    height: 40, // Height of the chips
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      children: [
                        const CategoryChip(text: 'All', icon: Icons.apps, isSelected: true),
                        const SizedBox(width: 8),
                        const CategoryChip(text: 'Fruits', icon: Icons.apple),
                        const SizedBox(width: 8),
                        const CategoryChip(text: 'Dairy', icon: Icons.water_drop),
                        const SizedBox(width: 8),
                        const CategoryChip(text: 'Bakery', icon: Icons.cake),
                        const SizedBox(width: 8),
                        const CategoryChip(text: 'Vegetables', icon: Icons.eco),
                        const SizedBox(width: 8),
                        const CategoryChip(text: 'Meat', icon: Icons.fastfood),
                      ],
                    ),
                  ),
                ),
                // Promotional Banner
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16.0),
                  height: 200, // Height of the banner
                  decoration: BoxDecoration(
                    color: Colors.grey.shade800, // Placeholder color
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: const Center(
                    child: Text(
                      'Promotional Banner',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                // Weekly Deals Section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Weekly Deals',
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.white),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const CategoriesPage()),
                          );
                        },
                        child: Text(
                          'See All',
                          style: Theme.of(context).textTheme.titleSmall?.copyWith(color: const Color(0xFF4CAF50)),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 268, // Height of the product cards
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    itemCount: weeklyDeals.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: ProductCard(product: weeklyDeals[index]),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 24),
                // Fresh Produce Section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Fresh Produce',
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.white),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const CategoriesPage()),
                          );
                        },
                        child: Text(
                          'See All',
                          style: Theme.of(context).textTheme.titleSmall?.copyWith(color: const Color(0xFF4CAF50)),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 268, // Height of the product cards
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    itemCount: freshProduce.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: ProductCard(product: freshProduce[index]),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }
}