import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:hci_app/src/features/models/cart_model.dart';
import 'package:hci_app/src/features/models/order_history_model.dart';
import 'package:hci_app/src/features/models/order_model.dart';
import 'package:hci_app/src/features/models/custom_id.dart';
import 'package:hci_app/src/core/widgets/custom_button.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  int _currentStep = 0;
  String? _selectedAddress = '123 Main St, Anytown, USA';
  String? _selectedPayment = 'Credit Card';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        title: const Text('Checkout'),
        backgroundColor: const Color(0xFF1E1E1E),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => GoRouter.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildStepIndicator(),
            const SizedBox(height: 24),
            // Conditionally display step content
            if (_currentStep == 0) _buildAddressStep(),
            if (_currentStep == 1) _buildPaymentStep(),
            if (_currentStep == 2) _buildReviewStep(),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomButtons(),
    );
  }

  Widget _buildStepIndicator() {
    return Row(
      children: [
        _buildIndicatorCircle('Address', 0),
        const Expanded(child: Divider(color: Color(0xFF424242))),
        _buildIndicatorCircle('Payment', 1),
        const Expanded(child: Divider(color: Color(0xFF424242))),
        _buildIndicatorCircle('Review', 2),
      ],
    );
  }

  Widget _buildIndicatorCircle(String title, int stepIndex) {
    bool isCompleted = _currentStep > stepIndex;
    bool isActive = _currentStep == stepIndex;
    Color color = isCompleted || isActive ? const Color(0xFF4CAF50) : const Color(0xFF424242);

    return Column(
      children: [
        CircleAvatar(
          backgroundColor: color,
          radius: 20,
          child: isCompleted
              ? const Icon(Icons.check, color: Colors.white)
              : Text('${stepIndex + 1}', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: TextStyle(color: color, fontWeight: isActive ? FontWeight.bold : FontWeight.normal),
        ),
      ],
    );
  }

  Widget _buildAddressStep() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Select Delivery Address', style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.white)),
        const SizedBox(height: 16),
        _buildSelectionCard(
          title: 'Home',
          subtitle: '123 Main St, Anytown, USA',
          isSelected: _selectedAddress == '123 Main St, Anytown, USA',
          onTap: () => setState(() => _selectedAddress = '123 Main St, Anytown, USA'),
        ),
        _buildSelectionCard(
          title: 'Work',
          subtitle: '456 Oak Ave, Sometown, USA',
          isSelected: _selectedAddress == '456 Oak Ave, Sometown, USA',
          onTap: () => setState(() => _selectedAddress = '456 Oak Ave, Sometown, USA'),
        ),
        TextButton.icon(
          icon: const Icon(Icons.add, color: Color(0xFF4CAF50)),
          label: const Text('Add New Address', style: TextStyle(color: Color(0xFF4CAF50))),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildPaymentStep() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Select Payment Method', style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.white)),
        const SizedBox(height: 16),
        _buildSelectionCard(
          title: 'Credit Card',
          subtitle: '**** **** **** 1234',
          icon: Icons.credit_card,
          isSelected: _selectedPayment == 'Credit Card',
          onTap: () => setState(() => _selectedPayment = 'Credit Card'),
        ),
        _buildSelectionCard(
          title: 'PayPal',
          subtitle: 'user@example.com',
          icon: Icons.paypal,
          isSelected: _selectedPayment == 'PayPal',
          onTap: () => setState(() => _selectedPayment = 'PayPal'),
        ),
      ],
    );
  }

  Widget _buildReviewStep() {
    final cart = Provider.of<CartModel>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Review Your Order', style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.white)),
        const SizedBox(height: 16),
        // Order Summary Card
        Card(
          color: const Color(0xFF1E1E1E),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: cart.items.length,
                  itemBuilder: (context, index) {
                    final item = cart.items[index];
                    return Row(
                      children: [
                        Image.network(item.product.imageUrl, width: 50, height: 50, fit: BoxFit.cover),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.product.name,
                                style: const TextStyle(color: Colors.white),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text('Qty: ${item.quantity}', style: const TextStyle(color: Colors.white70)),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        Text('\$${(item.product.price * item.quantity).toStringAsFixed(2)}', style: const TextStyle(color: Colors.white)),
                      ],
                    );
                  },
                ),
                const Divider(color: Color(0xFF424242)),
                _buildSummaryRow('Subtotal', cart.totalPrice),
                _buildSummaryRow('Delivery Fee', 2.00),
                const Divider(color: Color(0xFF424242)),
                _buildSummaryRow('Total', cart.totalPrice + 2.00, isTotal: true),
              ],
            ),
          ),
        ),
      ],
    );
  }

    Widget _buildSummaryRow(String title, double amount, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              color: isTotal ? Colors.white : Colors.white70,
              fontSize: isTotal ? 20 : 16,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            '\$${amount.toStringAsFixed(2)}',
            style: TextStyle(
              color: isTotal ? Colors.white : Colors.white70,
              fontSize: isTotal ? 20 : 16,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSelectionCard({required String title, required String subtitle, IconData? icon, required bool isSelected, required VoidCallback onTap}) {
    return Card(
      color: const Color(0xFF1E1E1E),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: isSelected ? const Color(0xFF4CAF50) : const Color(0xFF1E1E1E), width: 2),
      ),
      child: ListTile(
        leading: icon != null ? Icon(icon, color: Colors.white) : null,
        title: Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle, style: const TextStyle(color: Colors.white70)),
        onTap: onTap,
        trailing: isSelected ? const Icon(Icons.check_circle, color: Color(0xFF4CAF50)) : null,
      ),
    );
  }

  Widget _buildBottomButtons() {
    return Container(
      color: const Color(0xFF121212),
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          if (_currentStep > 0)
            Expanded(
              child: TextButton(
                onPressed: () {
                  setState(() {
                    _currentStep -= 1;
                  });
                },
                child: const Text('BACK', style: TextStyle(color: Colors.white)),
              ),
            ),
          if (_currentStep > 0) const SizedBox(width: 16),
          Expanded(
            flex: 2,
            child: CustomButton(
              text: _currentStep == 2 ? 'PLACE ORDER' : 'CONTINUE',
              onPressed: () {
                if (_currentStep < 2) {
                  setState(() {
                    _currentStep += 1;
                  });
                } else {
                  // Complete order logic
                  final cart = Provider.of<CartModel>(context, listen: false);
                  final orderHistory = Provider.of<OrderHistoryModel>(context, listen: false);

                  final newOrder = OrderModel(
                    id: generateCustomId(), // Unique ID for the order
                    items: List.from(cart.items), // Copy items from cart
                    totalPrice: cart.totalPrice + 2.00, // Subtotal + delivery fee
                    orderDate: DateTime.now(),
                    deliveryAddress: _selectedAddress ?? 'Unknown',
                    paymentMethod: _selectedPayment ?? 'Unknown',
                  );

                  orderHistory.addOrder(newOrder);
                  cart.clearCart(); // Clear the cart after placing the order

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Order placed successfully!')),
                  );
                  context.go('/delivery-tracking');
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}