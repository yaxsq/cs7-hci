import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:hci_app/src/features/models/order_history_model.dart';

class OrderHistoryPage extends StatelessWidget {
  const OrderHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Consumer<OrderHistoryModel>(
      builder: (context, orderHistory, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Order History'),
          ),
          body: ListView.builder(
            itemCount: orderHistory.orders.length,
            itemBuilder: (context, index) {
              final order = orderHistory.orders[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: ListTile(
                  title: Text('Order #${order.id}', style: theme.textTheme.titleMedium),
                  subtitle: Text(DateFormat.yMMMd().format(order.orderDate), style: theme.textTheme.bodySmall),
                  trailing: Text('\$${order.totalPrice.toStringAsFixed(2)}', style: theme.textTheme.titleMedium),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
