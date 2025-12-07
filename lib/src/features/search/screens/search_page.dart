import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hci_app/src/core/widgets/custom_text_field.dart';
import 'package:hci_app/src/core/widgets/product_card.dart';
import 'package:hci_app/src/features/models/product_model.dart';
import 'package:hci_app/src/features/models/dummy_products.dart';
import 'package:hci_app/src/features/accessibility/accessibility_provider.dart';
import 'package:provider/provider.dart';
import 'package:hci_app/generated/app_localizations.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  List<Product> _searchResults = []; // Placeholder for search results
  
  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _performSearch(String query, AppLocalizations localizations) {
    // In a real app, you would filter a product list or call an API here
    setState(() {
      _searchResults = getDummyProducts(localizations).where((product) =>
          product.name.toLowerCase().contains(query.toLowerCase())).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final localizations = AppLocalizations.of(context)!;
    final accessibilityProvider = Provider.of<AccessibilityProvider>(context);
    final isLargeFont = accessibilityProvider.largeFont;
    final cardWidth = isLargeFont ? 200.0 : 160.0;
    final cardHeight = isLargeFont ? 300.0 : 268.0;
    final aspectRatio = cardWidth / cardHeight;
    final List<String> _recentSearches = [localizations.organicMilk, localizations.freshBerries, localizations.cheddarCheese]; // Placeholder

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: theme.appBarTheme.backgroundColor,
            floating: true,
            snap: true,
            title: CustomTextField(
              controller: _searchController,
              hintText: localizations.searchHint,
              prefixIcon: Icon(Icons.search, color: theme.iconTheme.color),
              suffixIcon: IconButton(
                icon: Icon(Icons.clear, color: theme.iconTheme.color),
                onPressed: () {
                  _searchController.clear();
                  setState(() {
                    _searchResults = [];
                  });
                },
              ),
              onSubmitted: (value) => _performSearch(value, localizations),
            ),
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: theme.iconTheme.color),
              onPressed: () {
                if (_searchResults.isNotEmpty) {
                  _searchController.clear();
                  setState(() {
                    _searchResults = [];
                  });
                } else {
                  GoRouter.of(context).go('/categories/All');
                }
              },
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16.0),
            sliver: _searchResults.isEmpty
                ? SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          localizations.recentSearches,
                          style: theme.textTheme.titleLarge,
                        ),
                        const SizedBox(height: 16),
                        Wrap(
                          spacing: 8.0,
                          runSpacing: 8.0,
                          children: _recentSearches.map((search) => ActionChip(
                            label: Text(search, style: theme.textTheme.bodyMedium),
                            onPressed: () {
                              _searchController.text = search;
                              _performSearch(search, localizations);
                            },
                            backgroundColor: theme.cardColor,
                          )).toList(),
                        ),
                        const SizedBox(height: 24),
                        Text(
                          localizations.popularItems,
                          style: theme.textTheme.titleLarge,
                        ),
                        const SizedBox(height: 16),
                        // Placeholder for popular items, could be a ListView.builder of ProductCards
                        SizedBox(
                          height: accessibilityProvider.largeFont ? 300 : 268,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: getDummyProducts(localizations).length,
                            itemBuilder: (context, index) {
                              final product = getDummyProducts(localizations)[index];
                              return Padding(
                                padding: const EdgeInsets.only(right: 16.0),
                                child: ProductCard(
                                  product: product,
                                  onTap: () => GoRouter.of(context).push('/item/${product.id}'),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                : SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16.0,
                      crossAxisSpacing: 16.0,
                      childAspectRatio: aspectRatio,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final product = _searchResults[index];
                        return ProductCard(
                          product: product,
                          onTap: () => GoRouter.of(context).push('/item/${product.id}'),
                        );
                      },
                      childCount: _searchResults.length,
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}