import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
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
  List<Product> _searchResults = [];
  bool _isLoading = false;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _performSearch(String query, AppLocalizations localizations) async {
    if (query.isEmpty) return;

    setState(() {
      _isLoading = true;
    });

    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));
    
    if (!mounted) return;

    final results = getDummyProducts(localizations)
        .where((product) =>
            product.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    setState(() {
      _searchResults = results;
      _isLoading = false;
    });
  }

  Widget _buildInitialView(AppLocalizations localizations, ThemeData theme, AccessibilityProvider accessibilityProvider) {
    final List<String> recentSearches = [localizations.organicMilk, localizations.freshBerries, localizations.cheddarCheese];
    return SliverToBoxAdapter(
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
            children: recentSearches.map((search) => ActionChip(
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
    );
  }

  Widget _buildSearchResults(double aspectRatio) {
    return AnimationLimiter(
      child: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16.0,
          crossAxisSpacing: 16.0,
          childAspectRatio: aspectRatio,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final product = _searchResults[index];
            return AnimationConfiguration.staggeredGrid(
              position: index,
              duration: const Duration(milliseconds: 375),
              columnCount: 2,
              child: SlideAnimation(
                verticalOffset: 50.0,
                child: FadeInAnimation(
                  child: ProductCard(
                    product: product,
                    onTap: () => GoRouter.of(context).push('/item/${product.id}'),
                  ),
                ),
              ),
            );
          },
          childCount: _searchResults.length,
        ),
      ),
    );
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
                    _isLoading = false;
                  });
                },
              ),
              onSubmitted: (value) => _performSearch(value, localizations),
            ),
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: theme.iconTheme.color),
              onPressed: () {
                if (_searchResults.isNotEmpty || _isLoading) {
                  _searchController.clear();
                  setState(() {
                    _searchResults = [];
                    _isLoading = false;
                  });
                } else {
                  GoRouter.of(context).go('/categories/All');
                }
              },
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16.0),
            sliver: _isLoading
                ? SliverFillRemaining(
                    child: Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(theme.colorScheme.inversePrimary),
                      ),
                    ),
                  )
                : (_searchResults.isEmpty && _searchController.text.isEmpty
                    ? _buildInitialView(localizations, theme, accessibilityProvider)
                    : _buildSearchResults(aspectRatio)),
          ),
        ],
      ),
    );
  }
}