import 'package:flutter/foundation.dart';
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

  void add(Product product) {
    for (var item in _items) {
      if (item.product.id == product.id) {
        item.quantity++;
        notifyListeners();
        return;
      }
    }
    _items.add(CartItem(product: product));
    notifyListeners();
  }

  void remove(CartItem cartItem) {
    _items.remove(cartItem);
    notifyListeners();
  }

  void increment(CartItem cartItem) {
    cartItem.quantity++;
    notifyListeners();
  }

  void decrement(CartItem cartItem) {
    if (cartItem.quantity > 1) {
      cartItem.quantity--;
    } else {
      _items.remove(cartItem);
    }
    notifyListeners();
  }
}
