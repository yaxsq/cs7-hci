import 'package:flutter/foundation.dart';
import 'package:hci_app/src/features/models/order_model.dart';

class OrderHistoryModel extends ChangeNotifier {
  final List<Order> _orders = [];

  List<Order> get orders => _orders;

  void addOrder(Order order) {
    _orders.insert(0, order); // Add new orders to the beginning
    notifyListeners();
  }
}
