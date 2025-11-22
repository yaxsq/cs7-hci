import 'package:flutter/material.dart';
import 'package:hci_app/src/core/widgets/custom_button.dart';
import 'package:hci_app/src/features/models/product_model.dart';
import 'package:provider/provider.dart';
import 'package:hci_app/src/features/models/cart_model.dart';

class ItemListingPage extends StatelessWidget {
  final Product product;
  const ItemListingPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartModel>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300.0,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                product.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
              },
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.share),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.favorite_border),
                onPressed: () {},
              ),
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.white),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '\${product.price.toStringAsFixed(2)} / each',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(color: const Color(0xFFAADD78)),
                      ),
                      const SizedBox(height: 16),
                      // Quantity Selector
                      Row(
                        children: [
                          const Text('Quantity', style: TextStyle(color: Colors.white, fontSize: 16)),
                          const Spacer(),
                          IconButton(
                            icon: const Icon(Icons.remove, color: Colors.white),
                            onPressed: () {},
                          ),
                          const Text('1', style: TextStyle(color: Colors.white, fontSize: 18)),
                          IconButton(
                            icon: const Icon(Icons.add, color: Colors.white),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      const Divider(color: Colors.grey),
                      const SizedBox(height: 16),
                      Text(
                        'Description',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        product.description,
                        style: const TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                      const SizedBox(height: 16),
                      const Divider(color: Colors.grey),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Nutritional Information',
                            style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white),
                          ),
                          const Icon(Icons.keyboard_arrow_right, color: Colors.white),
                        ],
                      ),
                      const SizedBox(height: 32),
                      CustomButton(
                        text: 'Add to Cart',
                        onPressed: () {
                          cart.add(product);
                        },
                        width: double.infinity,
                        height: 50,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
