import 'package:flutter/material.dart';
import 'package:hci_app/src/core/widgets/custom_button.dart';
import 'package:hci_app/src/features/checkout/screens/checkout_page.dart';
import 'package:provider/provider.dart';
import 'package:hci_app/src/features/models/cart_model.dart';
import 'package:hci_app/src/features/models/cart_item_model.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartModel>(
      builder: (context, cart, child) {
        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            title: const Text('My Cart'),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
              },
            ),
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cart.items.length,
                  itemBuilder: (context, index) {
                    return _buildCartItem(context, cart.items[index]);
                  },
                ),
              ),
              // Order Summary
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: const BoxDecoration(
                  color: Color(0xFF1E1E1E),
                  border: Border(
                    top: BorderSide(color: Color(0xFF2C2C2C), width: 1.0),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Subtotal', style: TextStyle(color: Colors.white70)),
                        Text('\$${cart.totalPrice.toStringAsFixed(2)}', style: const TextStyle(color: Colors.white)),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Delivery Fee', style: TextStyle(color: Colors.white70)),
                        Text('\$2.00', style: TextStyle(color: Colors.white)),
                      ],
                    ),
                    const Divider(color: Colors.grey),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Total', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
                        Text('\$${(cart.totalPrice + 2.0).toStringAsFixed(2)}', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
                      ],
                    ),
                    const SizedBox(height: 16),
                    CustomButton(
                      text: 'Proceed to Checkout',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const CheckoutPage()),
                        );
                      },
                      width: double.infinity,
                      height: 50,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Continue Shopping', style: TextStyle(color: Color(0xFF4CAF50))),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Widget _buildCartItem(BuildContext context, CartItem item) {
    final cart = Provider.of<CartModel>(context, listen: false);
    return Card(
      color: const Color(0xFF1E1E1E),
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Image.network(
              item.product.imageUrl,
              width: 85,
              height: 85,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.product.name, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text(item.product.description, style: const TextStyle(color: Colors.white70)),
                  const SizedBox(height: 8),
                  Text('\$${item.product.price.toStringAsFixed(2)}', style: const TextStyle(color: Color(0xFFAADD78), fontSize: 16)),
                ],
              ),
            ),
            Row(
              children: [
                IconButton(onPressed: () => cart.decrement(item), icon: const Icon(Icons.remove, color: Colors.white, size: 20)),
                Text('${item.quantity}', style: const TextStyle(color: Colors.white, fontSize: 16)),
                IconButton(onPressed: () => cart.increment(item), icon: const Icon(Icons.add, color: Colors.white, size: 20)),
              ],
            )
          ],
        ),
      ),
    );
  }
}