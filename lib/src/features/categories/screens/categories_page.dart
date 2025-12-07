import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:go_router/go_router.dart';
import 'package:hci_app/src/core/widgets/product_card.dart';
import 'package:hci_app/src/core/widgets/category_chip.dart';
import 'package:hci_app/src/features/models/product_model.dart';
import 'package:hci_app/src/features/models/dummy_products.dart';
import 'package:hci_app/generated/app_localizations.dart';

class CategoriesPage extends StatefulWidget {
  final String category;

  const CategoriesPage({super.key, required this.category});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  bool _isLoading = true;
  List<Product> _filteredProducts = [];

  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

  @override
  void didUpdateWidget(CategoriesPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.category != widget.category) {
      _loadProducts();
    }
  }

  Future<void> _loadProducts() async {
    setState(() {
      _isLoading = true;
    });

    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));

    if (!mounted) return;

    final localizations = AppLocalizations.of(context)!;
    List<Product> products;

    if (widget.category == 'All') {
      products = getDummyProducts(localizations);
    } else if (widget.category == 'Weekly Deals') {
      products = getDummyProducts(localizations)
          .where((product) => product.oldPrice != null)
          .toList();
    } else {
      products = getDummyProducts(localizations)
          .where((product) =>
              product.category.toLowerCase() == widget.category.toLowerCase())
          .toList();
    }

    setState(() {
      _filteredProducts = products;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final localizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category),
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
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(theme.colorScheme.primary),
              ),
            )
          : AnimationLimiter(
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 60,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 10.0),
                        children: [
                          localizations.all,
                          localizations.fruits,
                          localizations.vegetables,
                          localizations.dairy,
                          localizations.bakery,
                          localizations.meat
                        ].map((cat) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: CategoryChip(
                              text: cat,
                              isSelected: widget.category == cat,
                              onPressed: () =>
                                  GoRouter.of(context).go('/categories/$cat'),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.all(16.0),
                    sliver: SliverGrid(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 16.0,
                        crossAxisSpacing: 16.0,
                        childAspectRatio: 160 / 268, // width / height
                      ),
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return AnimationConfiguration.staggeredGrid(
                            position: index,
                            duration: const Duration(milliseconds: 375),
                            columnCount: 2,
                            child: SlideAnimation(
                              verticalOffset: 50.0,
                              child: FadeInAnimation(
                                child: ProductCard(
                                  product: _filteredProducts[index],
                                  onTap: () {
                                    GoRouter.of(context).push(
                                        '/item/${_filteredProducts[index].id}');
                                  },
                                ),
                              ),
                            ),
                          );
                        },
                        childCount: _filteredProducts.length,
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
