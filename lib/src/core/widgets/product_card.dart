import 'package:flutter/material.dart';
import 'package:hci_app/src/core/widgets/custom_button.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';
import 'package:hci_app/src/features/models/cart_model.dart';
import 'package:hci_app/src/features/models/product_model.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartModel>(context, listen: false);
    return Card(
      color: const Color(0xFF1e1e1e), // Dark grey background
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0), // 12px border radius
      ),
      elevation: 2, // Subtle shadow
      child: SizedBox(
        width: 160, // Fixed width based on Figma
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
                  color: Colors.grey.shade800,
                  child: const Center(
                    child: CircularProgressIndicator(strokeWidth: 2.0),
                  ),
                ),
                errorWidget: (context, url, error) => Container(
                  height: 160,
                  color: Colors.grey,
                  child: const Center(
                    child: Icon(Icons.broken_image, color: Colors.white),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Text(
                          '\$${product.price.toStringAsFixed(2)}',
                          style: const TextStyle(
                            color: Color(0xFFAADD78), // Green for current price
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        if (product.oldPrice != null) ...[
                          const SizedBox(width: 8),
                          Text(
                            '\$${product.oldPrice!.toStringAsFixed(2)}',
                            style: const TextStyle(
                              color: Color(0xFFBDBDBD), // Grey for old price
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ],
                      ],
                    ),
                    const Spacer(), // Use Spacer to push the button to the bottom
                    CustomButton(
                      text: 'Add',
                      onPressed: () {
                        cart.add(product);
                      },
                      width: double.infinity, // Full width of the card
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
