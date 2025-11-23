import 'package:hci_app/src/features/models/cart_item_model.dart';

class Order {
  final String id;
  final List<CartItem> items;
  final double totalAmount;
  final DateTime orderDate;
  final String deliveryAddress;
  final String paymentMethod;
  final String status;

  Order({
    required this.id,
    required this.items,
    required this.totalAmount,
    required this.orderDate,
    required this.deliveryAddress,
    required this.paymentMethod,
    this.status = 'Pending',
  });
}
