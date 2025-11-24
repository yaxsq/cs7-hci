import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hci_app/src/features/delivery_tracking/screens/delivery_tracking_page.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Account'),
        automaticallyImplyLeading: false, // No back button
      ),
      body: ListView(
        children: [
          const SizedBox(height: 20),
          // Profile Header
          const CircleAvatar(
            radius: 50,
            backgroundColor: Colors.grey,
            child: Icon(Icons.person, size: 50, color: Colors.white),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Syed Rafay Ahmed',
                style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: const Icon(Icons.edit, color: Colors.white, size: 20),
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.history, color: Colors.white, size: 20),
              const SizedBox(width: 8),
              TextButton(
                onPressed: () => GoRouter.of(context).go('/account/order-history'),
                child: const Text('Order History', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
          const Divider(color: Colors.grey, indent: 20, endIndent: 20),

          // Information Sections
          _buildInfoSection(
            title: 'Delivery Address',
            content: 'Jane Doe\n2464 Royal Ln. Mesa, New Jersey 45463',
            icon: Icons.location_on,
          ),
          _buildInfoSection(
            title: 'Email',
            content: 'syedrafayahmeds@gmail.com',
            icon: Icons.email,
          ),
          _buildInfoSection(
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
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4CAF50),
                foregroundColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoSection({required String title, required String content, required IconData icon}) {
    return Card(
      color: const Color(0xFF1E1E1E),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: Icon(icon, color: Colors.white),
        title: Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        subtitle: Text(content, style: const TextStyle(color: Colors.white70)),
        trailing: TextButton(
          onPressed: () {},
          child: const Text('Change', style: TextStyle(color: Color(0xFF4CAF50))),
        ),
      ),
    );
  }
}
