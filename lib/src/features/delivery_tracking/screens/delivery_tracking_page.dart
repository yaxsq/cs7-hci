import 'package:flutter/material.dart';

class DeliveryTrackingPage extends StatelessWidget {
  const DeliveryTrackingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Track Order'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          },
        ),
      ),
      body: Column(
        children: [
          // Placeholder for the map
          Container(
            height: 300,
            color: Colors.grey.shade800,
            child: const Center(
              child: Text(
                'Map Placeholder',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Order Details',
                    style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  const Text('Order ID: #123456', style: TextStyle(color: Colors.white70)),
                  const Text('Estimated Delivery: 20-30 min', style: TextStyle(color: Colors.white70)),
                  const Divider(color: Colors.grey, height: 30),
                  const Text(
                    'Driver Information',
                    style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  const Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.grey,
                        child: Icon(Icons.person, size: 30, color: Colors.white),
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('John Doe', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                          Text('Toyota Prius - ABC-123', style: TextStyle(color: Colors.white70)),
                        ],
                      ),
                      Spacer(),
                      Icon(Icons.phone, color: Colors.white),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
