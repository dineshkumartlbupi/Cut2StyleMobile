// 2. SavedAddressesScreen.dart
import 'package:flutter/material.dart';

class SavedAddressesScreen extends StatelessWidget {
  const SavedAddressesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Saved Addresses")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {}, // Add new address
        child: const Icon(Icons.add),
      ),
      body: ListView(
        children: const [
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Home Address"),
            subtitle: Text("123, Main Street, City"),
            trailing: Icon(Icons.edit),
          ),
          ListTile(
            leading: Icon(Icons.work),
            title: Text("Office Address"),
            subtitle: Text("456, Work Lane, City"),
            trailing: Icon(Icons.edit),
          ),
        ],
      ),
    );
  }
}
