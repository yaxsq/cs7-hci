import 'package:hci_app/src/features/models/cart_item_model.dart';

class OrderModel {
  final String id;
  final List<CartItem> items;
  final double totalPrice;
  final DateTime orderDate;
  final String deliveryAddress;
  final String paymentMethod;

  OrderModel({
    required this.id,
    required this.items,
    required this.totalPrice,
    required this.orderDate,
    required this.deliveryAddress,
    required this.paymentMethod,
  });
}