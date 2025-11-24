import 'package:flutter/foundation.dart';
import 'package:hci_app/src/features/models/order_model.dart';
import 'package:hci_app/src/features/models/dummy_orders.dart';
import 'package:hci_app/generated/app_localizations.dart';

class OrderHistoryModel extends ChangeNotifier {
  final List<OrderModel> _orders = []; // Initialize as empty, will be populated later

  List<OrderModel> get orders => _orders;

  void addOrder(OrderModel order) {
    _orders.add(order);
    notifyListeners();
  }

  // Method to populate orders with localized data
  void populateOrders(AppLocalizations localizations) {
    _orders.clear();
    _orders.addAll(getDummyOrders(localizations));
    notifyListeners();
  }
}