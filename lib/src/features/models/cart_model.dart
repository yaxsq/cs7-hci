import 'package:flutter/foundation.dart';
import 'package:hci_app/src/core/analytics/analytics_service.dart';
import 'package:hci_app/src/features/models/cart_item_model.dart';
import 'package:hci_app/src/features/models/product_model.dart';

class CartModel extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  double get totalPrice {
    double total = 0;
    for (var item in _items) {
      total += item.product.price * item.quantity;
    }
    return total;
  }

  void add(Product product, {int quantity = 1}) {
    for (var item in _items) {
      if (item.product.id == product.id) {
        item.quantity += quantity;
        AnalyticsService.instance.logEvent(
          'update_cart_quantity',
          parameters: {
            'item_id': product.id,
            'new_quantity': item.quantity,
          },
        );
        notifyListeners();
        return;
      }
    }
    _items.add(CartItem(product: product, quantity: quantity));
    AnalyticsService.instance.logEvent(
      'add_to_cart',
      parameters: {
        'item_id': product.id,
        'item_name': product.name,
        'quantity': quantity,
        'price': product.price,
      },
    );
    notifyListeners();
  }

  void remove(CartItem cartItem) {
    _items.remove(cartItem);
    AnalyticsService.instance.logEvent(
      'remove_from_cart',
      parameters: {
        'item_id': cartItem.product.id,
      },
    );
    notifyListeners();
  }

  void increment(CartItem cartItem) {
    cartItem.quantity++;
    AnalyticsService.instance.logEvent(
      'update_cart_quantity',
      parameters: {
        'item_id': cartItem.product.id,
        'new_quantity': cartItem.quantity,
      },
    );
    notifyListeners();
  }

  void decrement(CartItem cartItem) {
    if (cartItem.quantity > 1) {
      cartItem.quantity--;
      AnalyticsService.instance.logEvent(
        'update_cart_quantity',
        parameters: {
          'item_id': cartItem.product.id,
          'new_quantity': cartItem.quantity,
        },
      );
    } else {
      _items.remove(cartItem);
      AnalyticsService.instance.logEvent(
        'remove_from_cart',
        parameters: {
          'item_id': cartItem.product.id,
        },
      );
    }
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
