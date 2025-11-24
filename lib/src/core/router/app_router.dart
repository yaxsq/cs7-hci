import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hci_app/src/features/account/screens/account_page.dart';
import 'package:hci_app/src/features/account/screens/add_address_page.dart';
import 'package:hci_app/src/features/cart/screens/cart_page.dart';
import 'package:hci_app/src/features/categories/screens/categories_page.dart';
import 'package:hci_app/src/features/checkout/screens/checkout_page.dart';
import 'package:hci_app/src/features/delivery_tracking/screens/delivery_tracking_page.dart';
import 'package:hci_app/src/features/item_listing/screens/item_listing_page.dart';
import 'package:hci_app/src/features/landing/screens/landing_page.dart';
import 'package:hci_app/src/features/order_history/screens/order_history_page.dart';
import 'package:hci_app/src/features/search/screens/search_page.dart';
import 'package:hci_app/src/features/shell/screens/shell_page.dart';
import 'package:hci_app/src/features/splash/screens/splash_page.dart';
import 'package:hci_app/src/features/accessibility/screens/accessibility_page.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  initialLocation: '/splash',
  navigatorKey: _rootNavigatorKey,
  routes: [
    GoRoute(
      path: '/splash',
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: '/accessibility',
      builder: (context, state) => const AccessibilityPage(),
    ),
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return ShellPage(child: child, state: state);
      },
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const LandingPage(),
          routes: [
            GoRoute(
              path: 'item/:id',
              builder: (context, state) =>
                  ItemListingPage(itemId: state.pathParameters['id']!),
            ),
          ],
        ),
        GoRoute(
          path: '/categories',
          redirect: (_, __) => '/categories/All',
        ),
        GoRoute(
          path: '/categories/:category',
          builder: (context, state) => CategoriesPage(
            category: state.pathParameters['category']!,
          ),
        ),
        GoRoute(
          path: '/cart',
          builder: (context, state) => const CartPage(),
        ),
        GoRoute(
            path: '/account',
            builder: (context, state) => const AccountPage(),
            routes: [
              GoRoute(
                path: 'order-history',
                builder: (context, state) => const OrderHistoryPage(),
              ),
              GoRoute(
                path: 'add-address',
                builder: (context, state) => const AddAddressPage(),
              ),
            ]),
        GoRoute(
          path: '/search',
          builder: (context, state) => const SearchPage(),
        ),
        GoRoute(
          path: '/checkout',
          builder: (context, state) => const CheckoutPage(),
        ),
        GoRoute(
          path: '/delivery-tracking',
          builder: (context, state) => const DeliveryTrackingPage(),
        ),
      ],
    ),
  ],
);
