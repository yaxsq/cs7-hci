import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:hci_app/src/features/models/cart_model.dart';
import 'package:hci_app/src/features/models/product_model.dart';
import 'package:hci_app/src/core/widgets/custom_button.dart';

class ItemListingPage extends StatefulWidget {
  final String itemId;

  const ItemListingPage({super.key, required this.itemId});

  @override
  State<ItemListingPage> createState() => _ItemListingPageState();
}

class _ItemListingPageState extends State<ItemListingPage> {
  int _quantity = 1;

  @override
  Widget build(BuildContext context) {
    // For now, we'll find a dummy product. In a real app, you'd fetch this from a service.
    final product = dummyProducts.firstWhere((p) => p.id == widget.itemId, orElse: () => dummyProducts.first);
    final cart = Provider.of<CartModel>(context, listen: false);

    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300.0,
            pinned: true,
            backgroundColor: const Color(0xFF1E1E1E),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => GoRouter.of(context).pop(),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.share, color: Colors.white),
                onPressed: () {
                  // Handle share action
                },
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: CachedNetworkImage(
                imageUrl: product.imageUrl,
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(color: Colors.grey.shade800),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          product.name,
                          style: const TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.favorite_border, color: Colors.white, size: 28),
                        onPressed: () {
                          // Handle favorite action
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '\$${product.price.toStringAsFixed(2)}',
                    style: const TextStyle(color: Color(0xFFAADD78), fontSize: 24, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Quantity',
                        style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFF2C2C2C),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove, color: Colors.white),
                              onPressed: () {
                                if (_quantity > 1) {
                                  setState(() {
                                    _quantity--;
                                  });
                                }
                              },
                            ),
                            Text(
                              '$_quantity',
                              style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            IconButton(
                              icon: const Icon(Icons.add, color: Colors.white),
                              onPressed: () {
                                setState(() {
                                  _quantity++;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const Divider(color: Color(0xFF2C2C2C)),
                  _buildExpandableSection('Product Details', product.description),
                  const Divider(color: Color(0xFF2C2C2C)),
                  _buildExpandableSection('Nutritional Facts', 'Calories: 150, Fat: 10g, Protein: 5g, Carbs: 10g'), // Placeholder
                  const Divider(color: Color(0xFF2C2C2C)),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomButton(
          text: 'Add to Cart',
          onPressed: () {
            cart.add(product, quantity: _quantity);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: const Color(0xFF2C2C2C),
                content: Text(
                  '${product.name} (x$_quantity) added to cart!',
                  style: const TextStyle(color: Colors.white),
                ),
                duration: const Duration(seconds: 2),
              ),
            );
          },
          height: 56,
        ),
      ),
    );
  }

  Widget _buildExpandableSection(String title, String content) {
    return ExpansionTile(
      title: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
      ),
      iconColor: Colors.white,
      collapsedIconColor: Colors.white,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0).copyWith(top: 0),
          child: Text(
            content,
            style: const TextStyle(color: Colors.white70, fontSize: 16),
          ),
        ),
      ],
    );
  }
}

final List<Product> dummyProducts = [
  Product(id: '1', name: 'Organic Eggs', description: 'A dozen of our finest organic eggs.', price: 3.99, oldPrice: 4.99, imageUrl: 'https://www.figma.com/api/mcp/asset/a61aaf82-3192-4f8a-9f02-6d195d487fef'),
  Product(id: '2', name: 'Sourdough Bread', description: 'Freshly baked sourdough bread.', price: 2.00, oldPrice: 3.50, imageUrl: 'https://www.figma.com/api/mcp/asset/a61aaf82-3192-4f8a-9f02-6d195d487fef'),
  Product(id: '3', name: 'Organic Milk', description: 'A gallon of fresh organic milk.', price: 2.00, oldPrice: 2.99, imageUrl: 'https://www.figma.com/api/mcp/asset/a61aaf82-3192-4f8a-9f02-6d195d487fef'),
  Product(id: '4', name: 'Cheddar Cheese', description: 'A block of sharp cheddar cheese.', price: 5.49, imageUrl: 'https://www.figma.com/api/mcp/asset/a61aaf82-3192-4f8a-9f02-6d195d487fef'),
  Product(id: '5', name: 'Avocados', description: 'A bag of ripe avocados.', price: 1.99, imageUrl: 'https://www.figma.com/api/mcp/asset/a61aaf82-3192-4f8a-9f02-6d195d487fef'),
  Product(id: '6', name: 'Bananas', description: 'A bunch of sweet bananas.', price: 0.59, imageUrl: 'https://www.figma.com/api/mcp/asset/a61aaf82-3192-4f8a-9f02-6d195d487fef'),
  Product(id: '7', name: 'Strawberries', description: 'A punnet of fresh strawberries.', price: 3.99, imageUrl: 'https://www.figma.com/api/mcp/asset/a61aaf82-3192-4f8a-9f02-6d195d487fef'),
];