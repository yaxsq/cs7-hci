import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class DeliveryTrackingPage extends StatelessWidget {
  const DeliveryTrackingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Track Delivery'),
      ),
      body: CachedNetworkImage(
        imageUrl: 'https://www.figma.com/api/mcp/asset/28a63497-6c0b-45a8-87b1-3b6a30bdb8d9',
        fit: BoxFit.cover,
        placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
        errorWidget: (context, url, error) => const Center(child: Icon(Icons.error)),
      ),
    );
  }
}