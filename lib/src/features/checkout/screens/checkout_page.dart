import 'package:hci_app/src/core/app_constants.dart';
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
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => GoRouter.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildStepIndicator(theme),
            const SizedBox(height: 24),
            // Conditionally display step content
            if (_currentStep == 0) _buildAddressStep(theme),
            if (_currentStep == 1) _buildPaymentStep(theme),
            if (_currentStep == 2) _buildReviewStep(theme),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomButtons(theme),
    );
  }

  Widget _buildStepIndicator(ThemeData theme) {
    return Row(
      children: [
        _buildIndicatorCircle(theme, 'Address', 0),
        Expanded(child: Divider(color: theme.dividerColor)),
        _buildIndicatorCircle(theme, 'Payment', 1),
        Expanded(child: Divider(color: theme.dividerColor)),
        _buildIndicatorCircle(theme, 'Review', 2),
      ],
    );
  }

  Widget _buildIndicatorCircle(ThemeData theme, String title, int stepIndex) {
    bool isCompleted = _currentStep > stepIndex;
    bool isActive = _currentStep == stepIndex;
    Color color = isCompleted || isActive ? theme.colorScheme.tertiary : theme.dividerColor;

    return Column(
      children: [
        CircleAvatar(
          backgroundColor: color,
          radius: 20,
          child: isCompleted
              ? Icon(Icons.check, color: theme.colorScheme.onPrimary)
              : Text('${stepIndex + 1}', style: theme.textTheme.titleMedium?.copyWith(color: theme.colorScheme.onPrimary)),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: theme.textTheme.bodyMedium?.copyWith(color: color, fontWeight: isActive ? FontWeight.bold : FontWeight.normal),
        ),
      ],
    );
  }

  Widget _buildAddressStep(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Select Delivery Address', style: theme.textTheme.headlineSmall),
        const SizedBox(height: 16),
        _buildSelectionCard(
          theme,
          title: 'Home',
          subtitle: '123 Main St, Anytown, USA',
          isSelected: _selectedAddress == '123 Main St, Anytown, USA',
          onTap: () => setState(() => _selectedAddress = '123 Main St, Anytown, USA'),
        ),
        _buildSelectionCard(
          theme,
          title: 'Work',
          subtitle: '456 Oak Ave, Sometown, USA',
          isSelected: _selectedAddress == '456 Oak Ave, Sometown, USA',
          onTap: () => setState(() => _selectedAddress = '456 Oak Ave, Sometown, USA'),
        ),
        TextButton.icon(
          icon: Icon(Icons.add, color: theme.colorScheme.tertiary),
          label: Text('Add New Address', style: TextStyle(color: theme.colorScheme.tertiary)),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildPaymentStep(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Select Payment Method', style: theme.textTheme.headlineSmall),
        const SizedBox(height: 16),
        _buildSelectionCard(
          theme,
          title: 'Credit Card',
          subtitle: '**** **** **** 1234',
          icon: Icons.credit_card,
          isSelected: _selectedPayment == 'Credit Card',
          onTap: () => setState(() => _selectedPayment = 'Credit Card'),
        ),
        _buildSelectionCard(
          theme,
          title: 'PayPal',
          subtitle: 'user@example.com',
          icon: Icons.paypal,
          isSelected: _selectedPayment == 'PayPal',
          onTap: () => setState(() => _selectedPayment = 'PayPal'),
        ),
      ],
    );
  }

  Widget _buildReviewStep(ThemeData theme) {
    final cart = Provider.of<CartModel>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Review Your Order', style: theme.textTheme.headlineSmall),
        const SizedBox(height: 16),
        // Order Summary Card
        Card(
          color: theme.cardColor,
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
                                style: theme.textTheme.bodyMedium,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text('Qty: ${item.quantity}', style: theme.textTheme.bodySmall),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        Text("\$${(item.product.price * item.quantity).toStringAsFixed(2)}", style: theme.textTheme.bodyMedium),
                      ],
                    );
                  },
                ),
                Divider(color: theme.dividerColor),
                _buildSummaryRow(theme, 'Subtotal', cart.totalPrice),
                _buildSummaryRow(theme, 'Delivery Fee', AppConstants.deliveryFee),
                Divider(color: theme.dividerColor),
                _buildSummaryRow(theme, 'Total', cart.totalPrice + AppConstants.deliveryFee, isTotal: true),
              ],
            ),
          ),
        ),
      ],
    );
  }

    Widget _buildSummaryRow(ThemeData theme, String title, double amount, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: isTotal ? theme.textTheme.titleLarge : theme.textTheme.bodyMedium,
          ),
          Text(
            "\$${amount.toStringAsFixed(2)}",
            style: isTotal ? theme.textTheme.titleLarge : theme.textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }

  Widget _buildSelectionCard(ThemeData theme, {required String title, required String subtitle, IconData? icon, required bool isSelected, required VoidCallback onTap}) {
    return Card(
      color: theme.cardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: isSelected ? theme.colorScheme.tertiary : theme.dividerColor, width: 2),
      ),
      child: ListTile(
        leading: icon != null ? Icon(icon, color: theme.iconTheme.color) : null,
        title: Text(title, style: theme.textTheme.titleMedium),
        subtitle: Text(subtitle, style: theme.textTheme.bodySmall),
        onTap: onTap,
        trailing: isSelected ? Icon(Icons.check_circle, color: theme.colorScheme.tertiary) : null,
      ),
    );
  }

  Widget _buildBottomButtons(ThemeData theme) {
    return Container(
      color: theme.bottomAppBarTheme.color,
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
                child: Text('BACK', style: theme.textTheme.labelLarge),
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
                    totalPrice: cart.totalPrice + AppConstants.deliveryFee, // Subtotal + delivery fee
                    orderDate: DateTime.now(),
                    deliveryAddress: _selectedAddress ?? 'Unknown',
                    paymentMethod: _selectedPayment ?? 'Unknown',
                  );

                  orderHistory.addOrder(newOrder);
                  cart.clearCart(); // Clear the cart after placing the order

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Order placed successfully!', style: theme.snackBarTheme.contentTextStyle)),
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