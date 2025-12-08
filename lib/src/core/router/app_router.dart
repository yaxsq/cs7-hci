import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hci_app/src/features/account/screens/account_page.dart';
import 'package:hci_app/src/features/account/screens/account_setup_page.dart';
import 'package:hci_app/src/features/account/screens/add_address_page.dart';
import 'package:hci_app/src/features/cart/screens/cart_page.dart';
import 'package:hci_app/src/features/categories/screens/categories_page.dart';
import 'package:hci_app/src/features/checkout/screens/checkout_page.dart';
import 'package:hci_app/src/features/checkout/screens/voucher_selection_page.dart';
import 'package:hci_app/src/features/delivery_tracking/screens/delivery_tracking_page.dart';
import 'package:hci_app/src/features/item_listing/screens/item_listing_page.dart';
import 'package:hci_app/src/features/landing/screens/landing_page.dart';
import 'package:hci_app/src/features/order_history/screens/order_history_page.dart';
import 'package:hci_app/src/features/search/screens/search_page.dart';
import 'package:hci_app/src/features/shell/screens/shell_page.dart';
import 'package:hci_app/src/features/splash/screens/splash_page.dart';
import 'package:hci_app/src/features/accessibility/screens/accessibility_page.dart';
import 'package:hci_app/src/core/router/fade_transition_page.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final shellNavigatorKey = GlobalKey<NavigatorState>();

final List<RouteBase> routes = [
  GoRoute(
    path: '/splash',
    pageBuilder: (context, state) => FadeTransitionPage(
      key: state.pageKey,
      child: const SplashPage(),
    ),
  ),
  GoRoute(
    path: '/account-setup',
    pageBuilder: (context, state) => FadeTransitionPage(
      key: state.pageKey,
      child: const AccountSetupPage(),
    ),
  ),
  GoRoute(
    path: '/accessibility',
    pageBuilder: (context, state) => FadeTransitionPage(
      key: state.pageKey,
      child: const AccessibilityPage(),
    ),
  ),
  ShellRoute(
    navigatorKey: shellNavigatorKey,
    pageBuilder: (context, state, child) => FadeTransitionPage(
      key: state.pageKey,
      child: ShellPage(child: child, state: state),
    ),
    routes: [
      GoRoute(
        path: '/',
        pageBuilder: (context, state) => FadeTransitionPage(
          key: state.pageKey,
          child: const LandingPage(),
        ),
        routes: [
          GoRoute(
            path: 'item/:id',
            pageBuilder: (context, state) => FadeTransitionPage(
              key: state.pageKey,
              child: ItemListingPage(itemId: state.pathParameters['id']!),
            ),
          ),
        ],
      ),
      GoRoute(
        path: '/categories',
        redirect: (_, __) => '/categories/All',
      ),
      GoRoute(
        path: '/categories/:category',
        pageBuilder: (context, state) => FadeTransitionPage(
          key: state.pageKey,
          child: CategoriesPage(
            category: state.pathParameters['category']!,
          ),
        ),
      ),
      GoRoute(
        path: '/cart',
        pageBuilder: (context, state) => FadeTransitionPage(
          key: state.pageKey,
          child: const CartPage(),
        ),
      ),
      GoRoute(
          path: '/account',
          pageBuilder: (context, state) => FadeTransitionPage(
                key: state.pageKey,
                child: const AccountPage(),
              ),
          routes: [
            GoRoute(
              path: 'order-history',
              pageBuilder: (context, state) => FadeTransitionPage(
                key: state.pageKey,
                child: const OrderHistoryPage(),
              ),
            ),
            GoRoute(
              path: 'add-address',
              pageBuilder: (context, state) => FadeTransitionPage(
                key: state.pageKey,
                child: const AddAddressPage(),
              ),
            ),
          ]),
      GoRoute(
        path: '/search',
        pageBuilder: (context, state) => FadeTransitionPage(
          key: state.pageKey,
          child: const SearchPage(),
        ),
      ),
      GoRoute(
        path: '/checkout',
        pageBuilder: (context, state) => FadeTransitionPage(
          key: state.pageKey,
          child: const CheckoutPage(),
        ),
      ),
      GoRoute(
        path: '/voucher-selection',
        pageBuilder: (context, state) => FadeTransitionPage(
          key: state.pageKey,
          child: const VoucherSelectionPage(),
        ),
      ),
      GoRoute(
        path: '/delivery-tracking',
        pageBuilder: (context, state) => FadeTransitionPage(
          key: state.pageKey,
          child: const DeliveryTrackingPage(),
        ),
      ),
    ],
  ),
];
