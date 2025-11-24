import 'package:hci_app/src/features/models/order_model.dart';
import 'package:hci_app/src/features/models/product_model.dart';
import 'package:hci_app/src/features/models/cart_item_model.dart';
import 'package:hci_app/src/features/models/dummy_products.dart';

final List<OrderModel> dummyOrders = [
  OrderModel(
    id: '1',
    items: [
      CartItem(product: dummyProducts[0], quantity: 2),
      CartItem(product: dummyProducts[2], quantity: 1),
    ],
    totalPrice: (dummyProducts[0].price * 2) + dummyProducts[2].price,
    orderDate: DateTime.now().subtract(const Duration(days: 5)),
    deliveryAddress: '123 Main St, Anytown, USA',
    paymentMethod: 'Credit Card',
  ),
  OrderModel(
    id: '2',
    items: [
      CartItem(product: dummyProducts[1], quantity: 1),
      CartItem(product: dummyProducts[3], quantity: 1),
      CartItem(product: dummyProducts[4], quantity: 3),
    ],
    totalPrice: dummyProducts[1].price + dummyProducts[3].price + (dummyProducts[4].price * 3),
    orderDate: DateTime.now().subtract(const Duration(days: 10)),
    deliveryAddress: '456 Oak Ave, Sometown, USA',
    paymentMethod: 'PayPal',
  ),
];
