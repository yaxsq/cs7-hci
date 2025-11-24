import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:hci_app/src/features/models/order_history_model.dart';
import 'package:hci_app/generated/app_localizations.dart';

class OrderHistoryPage extends StatefulWidget {
  const OrderHistoryPage({super.key});

  @override
  State<OrderHistoryPage> createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final localizations = AppLocalizations.of(context)!;
      Provider.of<OrderHistoryModel>(context, listen: false).populateOrders(localizations);
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final localizations = AppLocalizations.of(context)!;

    return Consumer<OrderHistoryModel>(
      builder: (context, orderHistory, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(localizations.orderHistory),
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
