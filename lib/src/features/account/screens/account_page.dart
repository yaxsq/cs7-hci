import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hci_app/src/features/delivery_tracking/screens/delivery_tracking_page.dart';
import 'package:hci_app/generated/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  String _userName = '';
  String _userEmail = '';
  String _userPhone = '';
  String _userAddress = '';

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    if (mounted) {
      setState(() {
        _userName = prefs.getString('userName') ?? 'Guest User';
        _userEmail = prefs.getString('userEmail') ?? 'guest@example.com';
        _userPhone = prefs.getString('userPhone') ?? '+1234567890';
        _userAddress = prefs.getString('userAddress') ?? '123 Main St, Anytown';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final localizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.accountTitle),
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
                _userName,
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
                child: Text(localizations.orderHistory, style: theme.textTheme.bodyMedium),
              ),
            ],
          ),
          const Divider(indent: 20, endIndent: 20),

          // Information Sections
          _buildInfoSection(
            context,
            title: localizations.deliveryAddressTitle,
            content: _userAddress,
            icon: Icons.location_on,
          ),
          _buildInfoSection(
            context,
            title: localizations.emailTitle,
            content: _userEmail,
            icon: Icons.email,
          ),
          _buildInfoSection(
            context,
            title: localizations.phoneNumberTitle,
            content: _userPhone,
            icon: Icons.phone,
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: theme.colorScheme.tertiary,
                foregroundColor: theme.colorScheme.onPrimary,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DeliveryTrackingPage()),
                );
              },
              icon: const Icon(Icons.track_changes),
              label: Text(localizations.trackOrder),
            ),
          ),
          const SizedBox(height: 20),
          TextButton.icon(
            onPressed: () async {
              final prefs = await SharedPreferences.getInstance();
              await prefs.setBool('hasCompletedSetup', false);
              await prefs.remove('userName');
              await prefs.remove('userEmail');
              await prefs.remove('userPhone');
              await prefs.remove('userAddress');

              if (context.mounted) {
                context.go('/accessibility');
              }
            },
            icon: const Icon(Icons.logout),
            label: Text(localizations.logout),
            style: TextButton.styleFrom(
              foregroundColor: theme.colorScheme.error,
            ),
          ),
          const SizedBox(height: 20),
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
          child: Text(AppLocalizations.of(context)!.change, style: TextStyle(color: theme.colorScheme.tertiary)),
        ),
      ),
    );
  }
}
