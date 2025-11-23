import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hci_app/src/core/widgets/custom_text_field.dart';
import 'package:hci_app/src/core/widgets/product_card.dart';
import 'package:hci_app/src/features/models/product_model.dart';
import 'package:hci_app/src/features/models/dummy_products.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  List<Product> _searchResults = []; // Placeholder for search results
  final List<String> _recentSearches = ['Organic Milk', 'Fresh Berries', 'Cheddar Cheese']; // Placeholder

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _performSearch(String query) {
    // In a real app, you would filter a product list or call an API here
    setState(() {
      _searchResults = dummyProducts.where((product) =>
          product.name.toLowerCase().contains(query.toLowerCase())).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Assuming a dark background
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: const Color(0xFF1E1E1E),
            floating: true,
            snap: true,
            title: CustomTextField(
              controller: _searchController,
              hintText: 'Search for groceries',
              prefixIcon: const Icon(Icons.search, color: Color(0xFFBDBDBD)),
              suffixIcon: IconButton(
                icon: const Icon(Icons.clear, color: Color(0xFFBDBDBD)),
                onPressed: () {
                  _searchController.clear();
                  setState(() {
                    _searchResults = [];
                  });
                },
              ),
              onSubmitted: (value) => _performSearch(value),
            ),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                if (GoRouter.of(context).canPop()) {
                  GoRouter.of(context).pop();
                }
              },
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16.0),
            sliver: _searchResults.isEmpty
                ? SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Recent Searches',
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white),
                        ),
                        const SizedBox(height: 16),
                        Wrap(
                          spacing: 8.0,
                          runSpacing: 8.0,
                          children: _recentSearches.map((search) => ActionChip(
                            label: Text(search, style: const TextStyle(color: Colors.white)),
                            onPressed: () {
                              _searchController.text = search;
                              _performSearch(search);
                            },
                            backgroundColor: const Color(0xFF2C2C2C),
                          )).toList(),
                        ),
                        const SizedBox(height: 24),
                        Text(
                          'Popular Items',
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white),
                        ),
                        const SizedBox(height: 16),
                        // Placeholder for popular items, could be a ListView.builder of ProductCards
                        SizedBox(
                          height: 268, // Height of the product cards
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: dummyProducts.length,
                            itemBuilder: (context, index) {
                              final product = dummyProducts[index];
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
                      ],
                    ),
                  )
                : SliverGrid(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16.0,
                      crossAxisSpacing: 16.0,
                      childAspectRatio: 160 / 268, // width / height
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final product = _searchResults[index];
                        return ProductCard(
                          product: product,
                          onTap: () => GoRouter.of(context).go('/item/${product.id}'),
                        );
                      },
                      childCount: _searchResults.length,
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

// Dummy products for demonstration. In a real app, this would come from a service.