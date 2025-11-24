import 'package:hci_app/src/features/models/order_model.dart';
import 'package:hci_app/src/features/models/product_model.dart';
import 'package:hci_app/src/features/models/cart_item_model.dart';
import 'package:hci_app/src/features/models/dummy_products.dart';
import 'package:hci_app/generated/app_localizations.dart';

List<OrderModel> getDummyOrders(AppLocalizations localizations) {
  final List<Product> products = getDummyProducts(localizations);

  return [
    OrderModel(
      id: '1',
      items: [
        CartItem(product: products[0], quantity: 2),
        CartItem(product: products[2], quantity: 1),
      ],
      totalPrice: (products[0].price * 2) + products[2].price,
      orderDate: DateTime.now().subtract(const Duration(days: 5)),
      deliveryAddress: localizations.homeAddress,
      paymentMethod: localizations.creditCard,
    ),
    OrderModel(
      id: '2',
      items: [
        CartItem(product: products[1], quantity: 1),
        CartItem(product: products[3], quantity: 1),
        CartItem(product: products[4], quantity: 3),
      ],
      totalPrice: products[1].price + products[3].price + (products[4].price * 3),
      orderDate: DateTime.now().subtract(const Duration(days: 10)),
      deliveryAddress: localizations.workAddress,
      paymentMethod: localizations.paypal,
    ),
  ];
}
