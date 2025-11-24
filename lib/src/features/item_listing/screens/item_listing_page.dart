import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:hci_app/src/features/models/cart_model.dart';
import 'package:hci_app/src/features/models/product_model.dart';
import 'package:hci_app/src/features/models/dummy_products.dart';
import 'package:hci_app/src/core/widgets/custom_button.dart';
import 'package:hci_app/generated/app_localizations.dart';

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
    final cart = Provider.of<CartModel>(context, listen: false);
    final theme = Theme.of(context);
    final localizations = AppLocalizations.of(context)!;
    final product = getDummyProducts(localizations).firstWhere((p) => p.id == widget.itemId, orElse: () => getDummyProducts(localizations).first);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300.0,
            pinned: true,
            backgroundColor: theme.appBarTheme.backgroundColor,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: theme.iconTheme.color),
              onPressed: () => GoRouter.of(context).pop(),
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.share, color: theme.iconTheme.color),
                onPressed: () {
                  // Handle share action
                },
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: CachedNetworkImage(
                imageUrl: product.imageUrl,
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(color: theme.cardColor),
                errorWidget: (context, url, error) => Icon(Icons.error, color: theme.iconTheme.color),
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
                          style: theme.textTheme.headlineSmall,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.favorite_border, color: theme.iconTheme.color, size: 28),
                        onPressed: () {
                          // Handle favorite action
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '\$${product.price.toStringAsFixed(2)}',
                    style: theme.textTheme.headlineSmall?.copyWith(color: theme.colorScheme.tertiary),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        localizations.quantity,
                        style: theme.textTheme.titleMedium,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: theme.cardColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.remove, color: theme.iconTheme.color),
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
                              style: theme.textTheme.titleMedium,
                            ),
                            IconButton(
                              icon: Icon(Icons.add, color: theme.iconTheme.color),
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
                  Divider(color: theme.dividerColor),
                  _buildExpandableSection(context, localizations.productDetails, product.description),
                  Divider(color: theme.dividerColor),
                  _buildExpandableSection(context, localizations.nutritionalFacts, localizations.nutritionalFactsContent), // Placeholder
                  Divider(color: theme.dividerColor),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomButton(
          text: localizations.addToCart,
          onPressed: () {
            cart.add(product, quantity: _quantity);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: theme.snackBarTheme.backgroundColor,
                content: Text(
                  localizations.itemAddedToCart(product.name, _quantity),
                  style: theme.snackBarTheme.contentTextStyle,
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

  Widget _buildExpandableSection(BuildContext context, String title, String content) {
    final theme = Theme.of(context);
    return ExpansionTile(
      title: Text(
        title,
        style: theme.textTheme.titleMedium,
      ),
      iconColor: theme.iconTheme.color,
      collapsedIconColor: theme.iconTheme.color,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0).copyWith(top: 0),
          child: Text(
            content,
            style: theme.textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}
