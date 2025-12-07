import 'package:hci_app/src/core/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hci_app/src/core/widgets/custom_button.dart';
import 'package:provider/provider.dart';
import 'package:hci_app/src/features/models/cart_model.dart';
import 'package:hci_app/src/features/models/cart_item_model.dart';
import 'package:hci_app/generated/app_localizations.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final localizations = AppLocalizations.of(context)!;

    return Consumer<CartModel>(
      builder: (context, cart, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(localizations.myCart),
          ),
          body: Column(
            children: [
              if (cart.items.isEmpty)
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          localizations.emptyCartMessage1,
                          style: theme.textTheme.titleLarge,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          localizations.emptyCartMessage2,
                          style: theme.textTheme.bodyMedium,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                )
              else
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
                decoration: BoxDecoration(
                  color: theme.cardColor,
                  border: Border(
                    top: BorderSide(color: theme.dividerColor, width: 1.0),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(localizations.subtotal, style: theme.textTheme.bodyMedium),
                        Text("\$${cart.totalPrice.toStringAsFixed(2)}", style: theme.textTheme.bodyMedium),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(localizations.deliveryFee, style: theme.textTheme.bodyMedium),
                        Text("\$${AppConstants.deliveryFee.toStringAsFixed(2)}", style: theme.textTheme.bodyMedium),
                      ],
                    ),
                    Divider(color: theme.dividerColor),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(localizations.total, style: theme.textTheme.titleLarge),
                        Text("\$${(cart.totalPrice + AppConstants.deliveryFee).toStringAsFixed(2)}", style: theme.textTheme.titleLarge),
                      ],
                    ),
                    const SizedBox(height: 16),
                    CustomButton(
                      text: localizations.proceedToCheckout,
                      onPressed: cart.items.isEmpty ? null : () {
                        GoRouter.of(context).go('/checkout');
                      },
                      width: double.infinity,
                      height: 50,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(localizations.continueShopping, style: TextStyle(color: theme.colorScheme.tertiary)),
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

      final theme = Theme.of(context);

  

      return Card(

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

                    Text(item.product.name, style: theme.textTheme.titleMedium, maxLines: 1, overflow: TextOverflow.ellipsis),

                    const SizedBox(height: 4),

                    Text(item.product.description, style: theme.textTheme.bodySmall, maxLines: 2, overflow: TextOverflow.ellipsis),

                    const SizedBox(height: 8),

                    Text("\$${item.product.price.toStringAsFixed(2)}", style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.tertiary)),

                  ],

                ),

              ),

              Row(

                children: [

                  IconButton(onPressed: () => cart.decrement(item), icon: Icon(Icons.remove, size: 20, color: theme.iconTheme.color)),

                  Text('${item.quantity}', style: theme.textTheme.bodyMedium),

                  IconButton(onPressed: () => cart.increment(item), icon: Icon(Icons.add, size: 20, color: theme.iconTheme.color)),

                ],

              )

            ],

          ),

        ),

      );

    }
}