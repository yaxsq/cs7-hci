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
    final theme = Theme.of(context);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: theme.appBarTheme.backgroundColor,
            floating: true,
            snap: true,
            title: CustomTextField(
              controller: _searchController,
              hintText: 'Search for groceries',
              prefixIcon: Icon(Icons.search, color: theme.iconTheme.color),
              suffixIcon: IconButton(
                icon: Icon(Icons.clear, color: theme.iconTheme.color),
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
              icon: Icon(Icons.arrow_back, color: theme.iconTheme.color),
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
                          style: theme.textTheme.titleLarge,
                        ),
                        const SizedBox(height: 16),
                        Wrap(
                          spacing: 8.0,
                          runSpacing: 8.0,
                          children: _recentSearches.map((search) => ActionChip(
                            label: Text(search, style: theme.textTheme.bodyMedium),
                            onPressed: () {
                              _searchController.text = search;
                              _performSearch(search);
                            },
                            backgroundColor: theme.cardColor,
                          )).toList(),
                        ),
                        const SizedBox(height: 24),
                        Text(
                          'Popular Items',
                          style: theme.textTheme.titleLarge,
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