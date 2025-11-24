import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hci_app/src/features/delivery_tracking/screens/delivery_tracking_page.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Account'),
        automaticallyImplyLeading: false, // No back button
        actions: [
          IconButton(
            icon: const Icon(Icons.accessibility),
            onPressed: () => GoRouter.of(context).go('/accessibility'),
          ),
        ],
      ),
      body: ListView(
        children: [
          const SizedBox(height: 20),
          // Profile Header
          CircleAvatar(
            radius: 50,
            backgroundColor: theme.colorScheme.secondary,
            child: Icon(Icons.person, size: 50, color: theme.colorScheme.onSecondary),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Syed Rafay Ahmed',
                style: theme.textTheme.titleLarge,
              ),
              IconButton(
                icon: const Icon(Icons.edit, size: 20),
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.history, size: 20),
              const SizedBox(width: 8),
              TextButton(
                onPressed: () => GoRouter.of(context).go('/account/order-history'),
                child: Text('Order History', style: theme.textTheme.bodyMedium),
              ),
            ],
          ),
          const Divider(indent: 20, endIndent: 20),

          // Information Sections
          _buildInfoSection(
            context,
            title: 'Delivery Address',
            content: 'Jane Doe\n2464 Royal Ln. Mesa, New Jersey 45463',
            icon: Icons.location_on,
          ),
          _buildInfoSection(
            context,
            title: 'Email',
            content: 'syedrafayahmeds@gmail.com',
            icon: Icons.email,
          ),
          _buildInfoSection(
            context,
            title: 'Phone Number',
            content: '+92 3482234578',
            icon: Icons.phone,
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DeliveryTrackingPage()),
                );
              },
              icon: const Icon(Icons.track_changes),
              label: const Text('Track Order'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoSection(BuildContext context, {required String title, required String content, required IconData icon}) {
    final theme = Theme.of(context);
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: Icon(icon),
        title: Text(title, style: theme.textTheme.titleMedium),
        subtitle: Text(content, style: theme.textTheme.bodySmall),
        trailing: TextButton(
          onPressed: () {},
          child: Text('Change', style: TextStyle(color: theme.colorScheme.tertiary)),
        ),
      ),
    );
  }
}
