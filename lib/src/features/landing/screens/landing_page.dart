import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hci_app/src/core/widgets/custom_text_field.dart';
import 'package:hci_app/src/core/widgets/category_chip.dart';
import 'package:hci_app/src/core/widgets/product_card.dart';
import 'package:hci_app/src/features/models/product_model.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedCategory = 'All';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Product> weeklyDeals = [
      Product(id: '1', name: 'Organic Eggs', description: '', price: 3.99, oldPrice: 4.99, imageUrl: 'https://www.figma.com/api/mcp/asset/a61aaf82-3192-4f8a-9f02-6d195d487fef'),
      Product(id: '2', name: 'Sourdough Bread', description: '', price: 2.00, oldPrice: 3.50, imageUrl: 'https://www.figma.com/api/mcp/asset/a61aaf82-3192-4f8a-9f02-6d195d487fef'),
      Product(id: '3', name: 'Organic Milk', description: '', price: 2.00, oldPrice: 2.99, imageUrl: 'https://www.figma.com/api/mcp/asset/a61aaf82-3192-4f8a-9f02-6d195d487fef'),
      Product(id: '4', name: 'Cheddar Cheese', description: '', price: 5.49, imageUrl: 'https://www.figma.com/api/mcp/asset/a61aaf82-3192-4f8a-9f02-6d195d487fef'),
    ];

    final List<Product> freshProduce = [
      Product(id: '5', name: 'Avocados', description: '', price: 1.99, imageUrl: 'https://www.figma.com/api/mcp/asset/a61aaf82-3192-4f8a-9f02-6d195d487fef'),
      Product(id: '6', name: 'Bananas', description: '', price: 0.59, imageUrl: 'https://www.figma.com/api/mcp/asset/a61aaf82-3192-4f8a-9f02-6d195d487fef'),
      Product(id: '7', name: 'Strawberries', description: '', price: 3.99, imageUrl: 'https://www.figma.com/api/mcp/asset/a61aaf82-3192-4f8a-9f02-6d195d487fef'),
    ];

    return Scaffold(
      backgroundColor: Colors.black, // Assuming a dark background for the scaffold
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            expandedHeight: 180, // Height of the top section (DELIVER TO + Search)
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
                    GestureDetector(
                      onTap: () => GoRouter.of(context).go('/search'),
                      child: AbsorbPointer(
                        child: CustomTextField(
                          controller: _searchController,
                          hintText: 'Search for groceries',
                          prefixIcon: const Icon(Icons.search, color: Color(0xFFBDBDBD)),
                        ),
                      ),
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
                                        CategoryChip(
                                          text: 'All',
                                          icon: Icons.apps,
                                          isSelected: _selectedCategory == 'All',
                                          onPressed: () {
                                            setState(() {
                                              _selectedCategory = 'All';
                                            });
                                            GoRouter.of(context).go('/categories');
                                          },
                                        ),
                                        const SizedBox(width: 8),
                                        CategoryChip(
                                          text: 'Fruits',
                                          icon: Icons.apple,
                                          isSelected: _selectedCategory == 'Fruits',
                                          onPressed: () {
                                            setState(() {
                                              _selectedCategory = 'Fruits';
                                            });
                                            GoRouter.of(context).go('/categories');
                                          },
                                        ),
                                        const SizedBox(width: 8),
                                        CategoryChip(
                                          text: 'Dairy',
                                          icon: Icons.water_drop,
                                          isSelected: _selectedCategory == 'Dairy',
                                          onPressed: () {
                                            setState(() {
                                              _selectedCategory = 'Dairy';
                                            });
                                            GoRouter.of(context).go('/categories');
                                          },
                                        ),
                                        const SizedBox(width: 8),
                                        CategoryChip(
                                          text: 'Bakery',
                                          icon: Icons.cake,
                                          isSelected: _selectedCategory == 'Bakery',
                                          onPressed: () {
                                            setState(() {
                                              _selectedCategory = 'Bakery';
                                            });
                                            GoRouter.of(context).go('/categories');
                                          },
                                        ),
                                        const SizedBox(width: 8),
                                        CategoryChip(
                                          text: 'Vegetables',
                                          icon: Icons.eco,
                                          isSelected: _selectedCategory == 'Vegetables',
                                          onPressed: () {
                                            setState(() {
                                              _selectedCategory = 'Vegetables';
                                            });
                                            GoRouter.of(context).go('/categories');
                                          },
                                        ),
                                        const SizedBox(width: 8),
                                        CategoryChip(
                                          text: 'Meat',
                                          icon: Icons.fastfood,
                                          isSelected: _selectedCategory == 'Meat',
                                          onPressed: () {
                                            setState(() {
                                              _selectedCategory = 'Meat';
                                            });
                                            GoRouter.of(context).go('/categories');
                                          },
                                        ),
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
                        onPressed: () => GoRouter.of(context).go('/categories'),
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
                      final product = weeklyDeals[index];
                      return Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: ProductCard(
                          product: product,
                          onTap: () => GoRouter.of(context).go('/item/${product.id}'),
                        ),
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
                        onPressed: () => GoRouter.of(context).go('/categories'),
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
                      final product = freshProduce[index];
                      return Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: ProductCard(
                          product: product,
                          onTap: () => GoRouter.of(context).go('/item/${product.id}'),
                        ),
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