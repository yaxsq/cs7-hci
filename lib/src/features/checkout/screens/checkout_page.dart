import 'package:hci_app/src/core/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hci_app/src/features/models/voucher_model.dart';
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
    Color color = isCompleted || isActive
        ? theme.colorScheme.tertiary
        : theme.dividerColor;

    return Column(
      children: [
        CircleAvatar(
          backgroundColor: color,
          radius: 20,
          child: isCompleted
              ? Icon(Icons.check, color: theme.colorScheme.onPrimary)
              : Text(
                  '${stepIndex + 1}',
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: theme.colorScheme.onPrimary,
                  ),
                ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: color,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }

  Widget _buildAddressStep(ThemeData theme, AppLocalizations localizations) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          localizations.selectDeliveryAddress,
          style: theme.textTheme.headlineSmall,
        ),
        const SizedBox(height: 16),
        _buildSelectionCard(
          theme,
          title: localizations.home,
          subtitle: localizations.homeAddress,
          isSelected: _selectedAddress == '123 Main St, Anytown, USA',
          onTap: () =>
              setState(() => _selectedAddress = '123 Main St, Anytown, USA'),
        ),
        _buildSelectionCard(
          theme,
          title: localizations.work,
          subtitle: localizations.workAddress,
          isSelected: _selectedAddress == '456 Oak Ave, Sometown, USA',
          onTap: () =>
              setState(() => _selectedAddress = '456 Oak Ave, Sometown, USA'),
        ),
        TextButton.icon(
          icon: Icon(Icons.add, color: theme.colorScheme.tertiary),
          label: Text(
            localizations.addNewAddress,
            style: TextStyle(color: theme.colorScheme.tertiary),
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildPaymentStep(ThemeData theme, AppLocalizations localizations) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          localizations.selectPaymentMethod,
          style: theme.textTheme.headlineSmall,
        ),
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
    return Consumer<VoucherModel>(
      builder: (context, voucherModel, child) {
        final double discount = voucherModel.discount;
        final double totalBeforeVoucher =
            cart.totalPrice + AppConstants.deliveryFee;
        final double finalTotal = (totalBeforeVoucher - discount) < 0
            ? 0
            : (totalBeforeVoucher - discount);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              localizations.reviewYourOrder,
              style: theme.textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),

            _buildVoucherSection(theme, localizations, voucherModel),
            const SizedBox(height: 16),

            Card(
              color: theme.cardColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
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
                        final double price = item.product.price * item.quantity;

                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  item.product.imageUrl,
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.cover,
                                ),
                              ),

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
                                    Text(
                                      localizations.quantityShort(
                                        item.quantity,
                                      ),
                                      style: theme.textTheme.bodySmall,
                                    ),
                                  ],
                                ),
                              ),

                              const SizedBox(width: 12),

                              Text(
                                "\$${price.toStringAsFixed(2)}",
                                style: theme.textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        );
                      },
                    ),

                    Divider(color: theme.dividerColor, height: 24),

                    _buildSummaryRow(
                      theme,
                      localizations.subtotal,
                      cart.totalPrice,
                    ),

                    _buildSummaryRow(
                      theme,
                      localizations.deliveryFee,
                      AppConstants.deliveryFee,
                    ),

                    if (discount > 0)
                      _buildSummaryRow(
                        theme,
                        localizations.voucherDiscount,
                        -discount,
                      ),

                    Divider(color: theme.dividerColor),

                    _buildSummaryRow(
                      theme,
                      localizations.total,
                      finalTotal,
                      isTotal: true,
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildVoucherSection(
    ThemeData theme,
    AppLocalizations localizations,
    VoucherModel voucherModel,
  ) {
    if (voucherModel.appliedVoucher == null) {
      return Center(
        child: OutlinedButton.icon(
          icon: const Icon(Icons.local_offer_outlined),
          label: Text(localizations.addVoucher),
          style: OutlinedButton.styleFrom(
            foregroundColor: theme.colorScheme.tertiary,
            side: BorderSide(color: theme.colorScheme.tertiary),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          ),
          onPressed: () => context.push('/voucher-selection'),
        ),
      );
    } else {
      return Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: theme.dividerColor),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      localizations.voucherApplied,
                      style: theme.textTheme.bodySmall,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      voucherModel.appliedVoucher!.code,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
              TextButton.icon(
                icon: const Icon(Icons.clear, size: 16),
                label: Text(localizations.remove),
                onPressed: () => voucherModel.clearVoucher(),
                style: TextButton.styleFrom(
                  foregroundColor: theme.colorScheme.error,
                ),
              ),
            ],
          ),
        ),
      );
    }
  }

  Widget _buildSummaryRow(
    ThemeData theme,
    String title,
    double amount, {
    bool isTotal = false,
  }) {
    final style = isTotal
        ? theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)
        : theme.textTheme.bodyMedium;
    final color = amount < 0
        ? Colors.green
        : (isTotal
              ? theme.textTheme.titleLarge?.color
              : theme.textTheme.bodyMedium?.color);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // FIX: Wrapped title in Expanded so it wraps instead of overflowing
          Expanded(
            child: Text(
              title,
              style: style,
              overflow:
                  TextOverflow.ellipsis, // Optional: adds "..." if too long
            ),
          ),
          const SizedBox(width: 16), // Spacing between title and price
          Text(
            "${amount < 0 ? '-' : ''}\$${amount.abs().toStringAsFixed(2)}",
            style: style?.copyWith(color: color),
          ),
        ],
      ),
    );
  }

  Widget _buildSelectionCard(
    ThemeData theme, {
    required String title,
    required String subtitle,
    IconData? icon,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Card(
      color: theme.cardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: isSelected ? theme.colorScheme.tertiary : theme.dividerColor,
          width: 2,
        ),
      ),
      child: ListTile(
        leading: icon != null ? Icon(icon, color: theme.iconTheme.color) : null,
        title: Text(title, style: theme.textTheme.titleMedium),
        subtitle: Text(subtitle, style: theme.textTheme.bodySmall),
        onTap: onTap,
        trailing: isSelected
            ? Icon(Icons.check_circle, color: theme.colorScheme.tertiary)
            : null,
      ),
    );
  }

  Widget _buildBottomButtons(ThemeData theme, AppLocalizations localizations) {
    final voucherModel = Provider.of<VoucherModel>(context, listen: false);
    final cart = Provider.of<CartModel>(context, listen: false);
    final double finalTotal =
        (cart.totalPrice + AppConstants.deliveryFee - voucherModel.discount)
            .clamp(0, double.infinity);

    return Container(
      color: theme.bottomAppBarTheme.color,
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
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
                child: Text(
                  localizations.back,
                  style: theme.textTheme.labelLarge,
                ),
              ),
            ),
          if (_currentStep > 0) const SizedBox(width: 8),
          Expanded(
            child: CustomButton(
              text: _currentStep == 2
                  ? localizations.placeOrder
                  : localizations.continueText,
              onPressed: () {
                if (_currentStep < 2) {
                  setState(() {
                    _currentStep += 1;
                  });
                } else {
                  // Complete order logic
                  final orderHistory = Provider.of<OrderHistoryModel>(
                    context,
                    listen: false,
                  );
                  final newOrder = OrderModel(
                    id: generateCustomId(),
                    items: List.from(cart.items),
                    totalPrice: finalTotal,
                    orderDate: DateTime.now(),
                    deliveryAddress: _selectedAddress ?? 'Unknown',
                    paymentMethod: _selectedPayment ?? 'Unknown',
                  );

                  orderHistory.addOrder(newOrder);
                  cart.clearCart();
                  voucherModel.clearVoucher(); // Reset voucher

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        localizations.orderPlacedSuccessfully,
                        style: theme.snackBarTheme.contentTextStyle,
                      ),
                    ),
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
