import 'package:flutter/material.dart';
import 'package:hci_app/src/core/widgets/custom_button.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';
import 'package:hci_app/src/features/models/cart_model.dart';
import 'package:hci_app/src/features/models/cart_item_model.dart';
import 'package:hci_app/src/features/models/product_model.dart';
import 'package:hci_app/src/features/accessibility/accessibility_provider.dart';
import 'package:hci_app/generated/app_localizations.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback? onTap;

  const ProductCard({
    super.key,
    required this.product,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final localizations = AppLocalizations.of(context)!;
    final accessibilityProvider = Provider.of<AccessibilityProvider>(context);

    return Semantics(
      label: '${product.name}, \$${product.price.toStringAsFixed(2)}',
      child: InkWell(
        onTap: onTap,
        child: Card(
          child: SizedBox(
            width: accessibilityProvider.largeFont ? 200 : 160,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12.0),
                    topRight: Radius.circular(12.0),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: product.imageUrl,
                    height: 160, // Fixed height from Figma
                    width: double.infinity,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Container(
                      height: 160,
                      color: theme.cardColor,
                      child: const Center(
                        child: CircularProgressIndicator(strokeWidth: 2.0),
                      ),
                    ),
                    errorWidget: (context, url, error) => Container(
                      height: 160,
                      color: theme.cardColor,
                      child: Center(
                        child: Icon(Icons.broken_image, color: theme.iconTheme.color),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.name,
                                style: theme.textTheme.titleMedium,
                                // Removed maxLines and overflow to allow wrapping
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  Text(
                                    '\$${product.price.toStringAsFixed(2)}',
                                    style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.tertiary),
                                  ),
                                  if (product.oldPrice != null) ...[
                                    const SizedBox(width: 8),
                                    Text(
                                      '\$${product.oldPrice!.toStringAsFixed(2)}',
                                      style: theme.textTheme.bodySmall?.copyWith(decoration: TextDecoration.lineThrough),
                                    ),
                                  ],
                                ],
                              ),
                            ],
                          ),
                          Consumer<CartModel>(
                            builder: (context, cart, child) {
                              final itemInCart = cart.items.where((item) => item.product.id == product.id).firstOrNull;

                              if (itemInCart == null) {
                                return CustomButton(
                                  text: localizations.add,
                                  onPressed: () {
                                    cart.add(product);
                                  },
                                  width: double.infinity,
                                );
                              } else {
                                return Container(
                                  decoration: BoxDecoration(
                                    color: theme.colorScheme.secondary,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      IconButton(
                                        icon: const Icon(Icons.remove),
                                        padding: EdgeInsets.zero,
                                        constraints: const BoxConstraints(),
                                        onPressed: () => cart.decrement(itemInCart),
                                      ),
                                      Text(
                                        '${itemInCart.quantity}',
                                        style: theme.textTheme.titleMedium,
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.add),
                                        padding: EdgeInsets.zero,
                                        constraints: const BoxConstraints(),
                                        onPressed: () => cart.increment(itemInCart),
                                      ),
                                    ],
                                  ),
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
