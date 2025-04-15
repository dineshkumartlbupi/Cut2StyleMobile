// 1. OrderHistoryScreen.dart
import 'package:flutter/material.dart';

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Order History")),
      body: ListView.builder(
        itemCount: 10, // Replace with actual order count
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: const Icon(Icons.shopping_bag),
              title: Text("Order #${1000 + index}"),
              subtitle: const Text("Delivered on Mar 20, 2025"),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // Navigate to order detail
              },
            ),
          );
        },
      ),
    );
  }
}
