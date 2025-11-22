import 'package:flutter/material.dart';
import 'package:hci_app/src/core/widgets/product_card.dart';
import 'package:hci_app/src/core/widgets/category_chip.dart';
import 'package:hci_app/src/features/item_listing/screens/item_listing_page.dart';
import 'package:hci_app/src/features/search/screens/search_page.dart';
import 'package:hci_app/src/features/models/product_model.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Product> products = [
      Product(id: '1', name: 'Organic Bananas', description: '', price: 1.29, imageUrl: 'https://www.figma.com/api/mcp/asset/a61aaf82-3192-4f8a-9f02-6d195d487fef'),
      Product(id: '2', name: 'Avocado Hass', description: '', price: 2.39, oldPrice: 2.99, imageUrl: 'https://www.figma.com/api/mcp/asset/a61aaf82-3192-4f8a-9f02-6d195d487fef'),
      Product(id: '3', name: 'Cherry Tomatoes', description: '', price: 4.99, imageUrl: 'https://www.figma.com/api/mcp/asset/a61aaf82-3192-4f8a-9f02-6d195d487fef'),
      Product(id: '4', name: 'Fresh Broccoli', description: '', price: 2.49, imageUrl: 'https://www.figma.com/api/mcp/asset/a61aaf82-3192-4f8a-9f02-6d195d487fef'),
      Product(id: '5', name: 'Red Bell Pepper', description: '', price: 1.99, imageUrl: 'https://www.figma.com/api/mcp/asset/a61aaf82-3192-4f8a-9f02-6d195d487fef'),
      Product(id: '6', name: 'Baby Spinach', description: '', price: 3.99, imageUrl: 'https://www.figma.com/api/mcp/asset/a61aaf82-3192-4f8a-9f02-6d195d487fef'),
      Product(id: '7', name: 'English Cucumber', description: '', price: 1.79, imageUrl: 'https://www.figma.com/api/mcp/asset/a61aaf82-3192-4f8a-9f02-6d195d487fef'),
      Product(id: '8', name: 'Strawberries', description: '', price: 5.49, imageUrl: 'https://www.figma.com/api/mcp/asset/a61aaf82-3192-4f8a-9f02-6d195d487fef'),
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Fresh Produce'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back button press
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SearchPage()),
              );
            },
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: 60,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                children: [
                  const CategoryChip(text: 'All', isSelected: true),
                  const SizedBox(width: 8),
                  const CategoryChip(text: 'Fruits'),
                  const SizedBox(width: 8),
                  const CategoryChip(text: 'Vegetables'),
                  const SizedBox(width: 8),
                  const CategoryChip(text: 'Herbs'),
                  const SizedBox(width: 8),
                  const CategoryChip(text: 'Organic'),
                  const SizedBox(width: 8),
                  const CategoryChip(text: 'Salads'),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16.0),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16.0,
                crossAxisSpacing: 16.0,
                childAspectRatio: 160 / 268, // width / height
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ItemListingPage(product: products[index])),
                      );
                    },
                    child: ProductCard(product: products[index]),
                  );
                },
                childCount: products.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
