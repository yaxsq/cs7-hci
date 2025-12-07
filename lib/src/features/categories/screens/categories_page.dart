import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hci_app/src/core/widgets/product_card.dart';
import 'package:hci_app/src/core/widgets/category_chip.dart';
import 'package:hci_app/src/features/models/product_model.dart';
import 'package:hci_app/src/features/models/dummy_products.dart'; // Import dummy products
import 'package:hci_app/generated/app_localizations.dart';

class CategoriesPage extends StatelessWidget {
  final String category; // Add category parameter

  const CategoriesPage({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final localizations = AppLocalizations.of(context)!;
    List<Product> filteredProducts;

    if (category == 'All') {
      filteredProducts = getDummyProducts(localizations);
    } else if (category == 'Weekly Deals') {
      filteredProducts = getDummyProducts(localizations).where((product) => product.oldPrice != null).toList();
    } else {
      // Filter by the new category property
      filteredProducts = getDummyProducts(localizations)
          .where((product) => product.category.toLowerCase() == category.toLowerCase())
          .toList();
    }

    // For better testing purposes, print all items when loaded
    print('CategoriesPage loading with category: $category');
    print('Filtered Products: ${filteredProducts.map((p) => p.name).toList()}');

    return Scaffold(
      appBar: AppBar(
        title: Text(category),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => GoRouter.of(context).go('/'),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              GoRouter.of(context).go('/search');
            },
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: 60,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                children: [
                  localizations.all, localizations.fruits, localizations.vegetables, localizations.dairy, localizations.bakery, localizations.meat
                ].map((cat) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: CategoryChip(
                      text: cat,
                      isSelected: category == cat,
                      onPressed: () => GoRouter.of(context).go('/categories/$cat'),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16.0),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16.0,
                crossAxisSpacing: 16.0,
                childAspectRatio: 160 / 268, // width / height
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return ProductCard(
                    product: filteredProducts[index],
                    onTap: () {
                      GoRouter.of(context).push('/item/${filteredProducts[index].id}');
                    },
                  );
                },
                childCount: filteredProducts.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
