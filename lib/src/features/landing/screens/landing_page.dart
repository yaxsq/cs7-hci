import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hci_app/src/core/analytics/analytics_service.dart';
import 'package:hci_app/src/core/analytics/route_aware_widget.dart';
import 'package:hci_app/src/core/widgets/custom_text_field.dart';
import 'package:hci_app/src/core/widgets/category_chip.dart';
import 'package:hci_app/src/core/widgets/product_card.dart';
import 'package:hci_app/src/features/models/dummy_products.dart';
import 'package:hci_app/src/features/models/product_model.dart';
import 'package:hci_app/generated/app_localizations.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const RouteAwareWidget(
      screenName: 'Landing',
      child: LandingPageContent(),
    );
  }
}

class LandingPageContent extends StatefulWidget {
  const LandingPageContent({super.key});

  @override
  State<LandingPageContent> createState() => _LandingPageContentState();
}

class _LandingPageContentState extends State<LandingPageContent> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedCategory = 'All';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final localizations = AppLocalizations.of(context)!;
    final List<Product> weeklyDeals = getDummyProducts(localizations).sublist(0, 4);
    final List<Product> freshProduce = getDummyProducts(localizations).sublist(4, 7);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            expandedHeight: 180, // Height of the top section (DELIVER TO + Search)
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                padding: const EdgeInsets.all(16.0),
                color: theme.appBarTheme.backgroundColor,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 32), // Status bar padding
                      Text(
                        localizations.deliverTo,
                        style: theme.textTheme.bodySmall,
                      ),
                      Row(
                        children: [
                          Icon(Icons.location_on, size: 20),
                          const SizedBox(width: 8),
                          Flexible(
                            child: Text(
                              localizations.deliveryAddress,
                              style: theme.textTheme.titleMedium,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Icon(Icons.keyboard_arrow_down, size: 20),
                        ],
                      ),
                      const SizedBox(height: 16),
                      GestureDetector(
                        onTap: () => GoRouter.of(context).go('/search'),
                        child: AbsorbPointer(
                          child: CustomTextField(
                            controller: _searchController,
                            hintText: localizations.searchHint,
                            prefixIcon: const Icon(Icons.search),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(

            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                

                // Category Chips

                                Padding(

                                                                  padding: const EdgeInsets.symmetric(vertical: 16.0),

                                                                  child: SizedBox(

                                                                    height: 40, // Height of the chips

                                                                    child: ListView(

                                                                      scrollDirection: Axis.horizontal,

                                                                      padding: const EdgeInsets.symmetric(horizontal: 16.0),

                                                                      children: [

                                                                        CategoryChip(

                                                                          text: localizations.all,

                                                                          icon: Icons.apps,

                                                                          isSelected: _selectedCategory == 'All',

                                                                          onPressed: () {
                                                                            AnalyticsService.instance.logEvent(
                                                                              'select_category',
                                                                              parameters: {'category_name': 'All'},
                                                                            );

                                                                            setState(() {

                                                                              _selectedCategory = 'All';

                                                                            });

                                                                            GoRouter.of(context).go('/categories/All');

                                                                          },

                                                                        ),

                                                                        const SizedBox(width: 8),

                                                                        CategoryChip(

                                                                          text: localizations.fruits,

                                                                          icon: Icons.apple,

                                                                          isSelected: _selectedCategory == 'Fruits',

                                                                          onPressed: () {
                                                                            AnalyticsService.instance.logEvent(
                                                                              'select_category',
                                                                              parameters: {'category_name': 'Fruits'},
                                                                            );

                                                                            setState(() {

                                                                              _selectedCategory = 'Fruits';

                                                                            });

                                                                            GoRouter.of(context).go('/categories/Fruits');

                                                                          },

                                                                        ),

                                                                        const SizedBox(width: 8),

                                                                        CategoryChip(

                                                                          text: localizations.dairy,

                                                                          icon: Icons.water_drop,

                                                                          isSelected: _selectedCategory == 'Dairy',

                                                                          onPressed: () {
                                                                            AnalyticsService.instance.logEvent(
                                                                              'select_category',
                                                                              parameters: {'category_name': 'Dairy'},
                                                                            );

                                                                            setState(() {

                                                                              _selectedCategory = 'Dairy';

                                                                            });

                                                                            GoRouter.of(context).go('/categories/Dairy');

                                                                          },

                                                                        ),

                                                                        const SizedBox(width: 8),

                                                                        CategoryChip(

                                                                          text: localizations.bakery,

                                                                          icon: Icons.cake,

                                                                          isSelected: _selectedCategory == 'Bakery',

                                                                          onPressed: () {
                                                                            AnalyticsService.instance.logEvent(
                                                                              'select_category',
                                                                              parameters: {'category_name': 'Bakery'},
                                                                            );

                                                                            setState(() {

                                                                              _selectedCategory = 'Bakery';

                                                                            });

                                                                            GoRouter.of(context).go('/categories/Bakery');

                                                                          },

                                                                        ),

                                                                        const SizedBox(width: 8),

                                                                        CategoryChip(

                                                                          text: localizations.vegetables,

                                                                          icon: Icons.eco,

                                                                          isSelected: _selectedCategory == 'Vegetables',

                                                                          onPressed: () {
                                                                            AnalyticsService.instance.logEvent(
                                                                              'select_category',
                                                                              parameters: {'category_name': 'Vegetables'},
                                                                            );

                                                                            setState(() {

                                                                              _selectedCategory = 'Vegetables';

                                                                            });

                                                                            GoRouter.of(context).go('/categories/Vegetables');

                                                                          },

                                                                        ),

                                                                        const SizedBox(width: 8),

                                                                        CategoryChip(

                                                                          text: localizations.meat,

                                                                          icon: Icons.fastfood,

                                                                          isSelected: _selectedCategory == 'Meat',

                                                                          onPressed: () {
                                                                            AnalyticsService.instance.logEvent(
                                                                              'select_category',
                                                                              parameters: {'category_name': 'Meat'},
                                                                            );

                                                                            setState(() {

                                                                              _selectedCategory = 'Meat';

                                                                            });

                                                                            GoRouter.of(context).go('/categories/Meat');

                                                                          },

                                                                        ),

                                                                      ],

                                                                    ),

                                                                  ),

                                                                ),

                

                // Promotional Banner

                const PromotionalBanner(),

                                const SizedBox(height: 24),

                                // Weekly Deals Section

                                Padding(

                                  padding: const EdgeInsets.symmetric(horizontal: 16.0),

                                  child: Row(

                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                    children: [

                                      Text(

                                        localizations.weeklyDeals,

                                        style: theme.textTheme.headlineSmall,

                                      ),

                                      TextButton(

                                        onPressed: () => GoRouter.of(context).go('/categories/Weekly Deals'),

                                        child: Text(

                                          localizations.seeAll,

                                          style: theme.textTheme.titleSmall?.copyWith(color: theme.colorScheme.tertiary),

                                        ),

                                      ),

                                    ],

                                  ),

                                ),

                                const SizedBox(height: 16),

                                SizedBox(

                                  height: 268, // Height of the product cards

                                  child: ListView.builder(

                                    scrollDirection: Axis.horizontal,

                                    padding: const EdgeInsets.symmetric(horizontal: 16.0),

                                    itemCount: weeklyDeals.length,

                                    itemBuilder: (context, index) {

                                      final product = weeklyDeals[index];

                                      return Padding(

                                        padding: const EdgeInsets.only(right: 16.0),

                                        child: ProductCard(

                                          product: product,

                                          onTap: () => GoRouter.of(context).go('/item/${product.id}'),

                                        ),

                                      );

                                    },

                                  ),

                                ),

                                const SizedBox(height: 24),

                                // Fresh Produce Section

                                Padding(

                                  padding: const EdgeInsets.symmetric(horizontal: 16.0),

                                  child: Row(

                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                    children: [

                                      Text(

                                        localizations.freshProduce,

                                        style: theme.textTheme.headlineSmall,

                                      ),

                                      TextButton(

                                        onPressed: () => GoRouter.of(context).go('/categories/Fresh Produce'),

                                        child: Text(

                                          localizations.seeAll,

                                          style: theme.textTheme.titleSmall?.copyWith(color: theme.colorScheme.tertiary),

                                        ),

                                      ),

                                    ],

                                  ),

                                ),

                const SizedBox(height: 16),

                SizedBox(

                  height: 268, // Height of the product cards

                  child: ListView.builder(

                    scrollDirection: Axis.horizontal,

                    padding: const EdgeInsets.symmetric(horizontal: 16.0),

                    itemCount: freshProduce.length,

                    itemBuilder: (context, index) {

                      final product = freshProduce[index];

                      return Padding(

                        padding: const EdgeInsets.only(right: 16.0),

                        child: ProductCard(

                          product: product,

                          onTap: () => GoRouter.of(context).go('/item/${product.id}'),

                        ),

                      );

                    },

                  ),

                ),

                const SizedBox(height: 24),

              ],

            ),

          ),

        ],

      ),

    );
  }
}



class PromotionalBanner extends StatelessWidget {
  const PromotionalBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final localizations = AppLocalizations.of(context)!;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        image: const DecorationImage(
          image: NetworkImage("https://www.figma.com/api/mcp/asset/9c7b7061-216a-4d7c-a399-24c248b8bd49"),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Colors.black.withOpacity(0.6),
              Colors.transparent,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                localizations.summerBBQ,
                style: theme.textTheme.headlineSmall?.copyWith(color: Colors.white),
              ),
              const SizedBox(height: 4),
              Text(
                localizations.grillingSeason,
                style: theme.textTheme.bodyMedium?.copyWith(color: Colors.white.withOpacity(0.9)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
