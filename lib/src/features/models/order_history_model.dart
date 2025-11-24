import 'package:flutter/foundation.dart';
import 'package:hci_app/src/features/models/order_model.dart';
import 'package:hci_app/src/features/models/dummy_orders.dart';

class OrderHistoryModel extends ChangeNotifier {
  final List<OrderModel> _orders = dummyOrders;

  List<OrderModel> get orders => _orders;

  void addOrder(OrderModel order) {
    _orders.add(order);
    notifyListeners();
  }
}