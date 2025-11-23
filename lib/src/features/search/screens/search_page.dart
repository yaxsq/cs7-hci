import 'package:flutter/material.dart';
import 'package:hci_app/src/features/models/product_model.dart';
import 'package:hci_app/src/core/widgets/product_card.dart'; // Assuming a search result card is similar to product card

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Dummy data for search results
    final List<Product> searchResults = [
      Product(id: '1', name: 'Organic Milk', description: 'Half Gallon', price: 4.99, imageUrl: 'https://www.figma.com/api/mcp/asset/e7cb9305-8788-4fe2-aeea-7d26d4b84e3b'),
      Product(id: '2', name: 'Clover Sonoma Organic', description: 'Half Gallon', price: 2.99, imageUrl: 'https://www.figma.com/api/mcp/asset/ac3289d2-eb36-488b-99be-8cbe80edf9dd'),
      Product(id: '3', name: 'Stonyfield Organic Whole Milk', description: 'Half Gallon', price: 4.99, imageUrl: 'https://www.figma.com/api/mcp/asset/8ef3a749-4422-4042-a476-6dd873d7fd13'),
      Product(id: '4', name: 'Maple Hill Grass-Fed Whole Milk', description: 'Half Gallon', price: 4.99, imageUrl: 'https://www.figma.com/api/mcp/asset/65b2bc63-5776-4882-ac8c-f87eb5229578'),
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text('Search Results'),
            backgroundColor: Colors.black,
            pinned: true,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(120.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: 'organic milk',
                        prefixIcon: const Icon(Icons.search),
                        suffixIcon: const Icon(Icons.clear),
                        filled: true,
                        fillColor: Colors.grey[800],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Showing 25 results', style: TextStyle(color: Colors.white70)),
                        Row(
                          children: [
                            TextButton.icon(
                              onPressed: () {},
                              icon: const Icon(Icons.filter_list),
                              label: const Text('Filter'),
                            ),
                            TextButton.icon(
                              onPressed: () {},
                              icon: const Icon(Icons.sort),
                              label: const Text('Sort'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: SizedBox(
                    height: 268,
                    child: ProductCard(product: searchResults[index]),
                  ), // Reusing ProductCard for now
                );
              },
              childCount: searchResults.length,
            ),
          ),
        ],
      ),
    );
  }
}