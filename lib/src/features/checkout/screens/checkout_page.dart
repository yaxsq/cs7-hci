import 'package:hci_app/src/core/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:hci_app/src/features/models/cart_model.dart';
import 'package:hci_app/src/features/models/order_history_model.dart';
import 'package:hci_app/src/features/models/order_model.dart';
import 'package:hci_app/src/features/models/custom_id.dart';
import 'package:hci_app/src/core/widgets/custom_button.dart';
import 'package:hci_app/generated/app_localizations.dart';

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
    final localizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.checkout),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => GoRouter.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildStepIndicator(theme, localizations),
            const SizedBox(height: 24),
            // Conditionally display step content
            if (_currentStep == 0) _buildAddressStep(theme, localizations),
            if (_currentStep == 1) _buildPaymentStep(theme, localizations),
            if (_currentStep == 2) _buildReviewStep(theme, localizations),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomButtons(theme, localizations),
    );
  }

  Widget _buildStepIndicator(ThemeData theme, AppLocalizations localizations) {
    return Row(
      children: [
        _buildIndicatorCircle(theme, localizations.address, 0),
        Expanded(child: Divider(color: theme.dividerColor)),
        _buildIndicatorCircle(theme, localizations.payment, 1),
        Expanded(child: Divider(color: theme.dividerColor)),
        _buildIndicatorCircle(theme, localizations.review, 2),
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

  Widget _buildAddressStep(ThemeData theme, AppLocalizations localizations) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(localizations.selectDeliveryAddress, style: theme.textTheme.headlineSmall),
        const SizedBox(height: 16),
        _buildSelectionCard(
          theme,
          title: localizations.home,
          subtitle: localizations.homeAddress,
          isSelected: _selectedAddress == '123 Main St, Anytown, USA',
          onTap: () => setState(() => _selectedAddress = '123 Main St, Anytown, USA'),
        ),
        _buildSelectionCard(
          theme,
          title: localizations.work,
          subtitle: localizations.workAddress,
          isSelected: _selectedAddress == '456 Oak Ave, Sometown, USA',
          onTap: () => setState(() => _selectedAddress = '456 Oak Ave, Sometown, USA'),
        ),
        TextButton.icon(
          icon: Icon(Icons.add, color: theme.colorScheme.tertiary),
          label: Text(localizations.addNewAddress, style: TextStyle(color: theme.colorScheme.tertiary)),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildPaymentStep(ThemeData theme, AppLocalizations localizations) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(localizations.selectPaymentMethod, style: theme.textTheme.headlineSmall),
        const SizedBox(height: 16),
        _buildSelectionCard(
          theme,
          title: localizations.creditCard,
          subtitle: localizations.creditCardNumber,
          icon: Icons.credit_card,
          isSelected: _selectedPayment == 'Credit Card',
          onTap: () => setState(() => _selectedPayment = 'Credit Card'),
        ),
        _buildSelectionCard(
          theme,
          title: localizations.paypal,
          subtitle: localizations.paypalEmail,
          icon: Icons.paypal,
          isSelected: _selectedPayment == 'PayPal',
          onTap: () => setState(() => _selectedPayment = 'PayPal'),
        ),
      ],
    );
  }

  Widget _buildReviewStep(ThemeData theme, AppLocalizations localizations) {
    final cart = Provider.of<CartModel>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(localizations.reviewYourOrder, style: theme.textTheme.headlineSmall),
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
                              Text(localizations.quantityShort(item.quantity), style: theme.textTheme.bodySmall),
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
                _buildSummaryRow(theme, localizations.subtotal, cart.totalPrice),
                _buildSummaryRow(theme, localizations.deliveryFee, AppConstants.deliveryFee),
                Divider(color: theme.dividerColor),
                _buildSummaryRow(theme, localizations.total, cart.totalPrice + AppConstants.deliveryFee, isTotal: true),
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

  Widget _buildBottomButtons(ThemeData theme, AppLocalizations localizations) {
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
                child: Text(localizations.back, style: theme.textTheme.labelLarge),
              ),
            ),
          if (_currentStep > 0) const SizedBox(width: 16),
          Expanded(
            flex: 2,
            child: CustomButton(
              text: _currentStep == 2 ? localizations.placeOrder : localizations.continueText,
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
                    SnackBar(content: Text(localizations.orderPlacedSuccessfully, style: theme.snackBarTheme.contentTextStyle)),
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