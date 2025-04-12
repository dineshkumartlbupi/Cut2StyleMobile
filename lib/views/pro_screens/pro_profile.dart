import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProProfileScreen extends StatelessWidget {
  const ProProfileScreen({super.key});

  void _handleLogout(BuildContext context) {
    // Clear auth session or call AuthService.to.logout() if using GetX
    // Then navigate to login screen
    Get.offAllNamed('/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Professional Profile"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),

          // Profile Image & Name
          const CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(
              "https://images.unsplash.com/photo-1603415526960-f8f0f9de1a2f?auto=format&fit=crop&w=600&q=60",
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            "Alex Johnson",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            "Hair Stylist | Barber",
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),

          const SizedBox(height: 30),

          // Info Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: const [
                ListTile(
                  leading: Icon(Icons.phone, color: Colors.deepPurple),
                  title: Text("Phone"),
                  subtitle: Text("+1 234 567 890"),
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.email, color: Colors.deepPurple),
                  title: Text("Email"),
                  subtitle: Text("alex@cut2style.com"),
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.location_on, color: Colors.deepPurple),
                  title: Text("Address"),
                  subtitle: Text("Downtown, Orlando, FL"),
                ),
              ],
            ),
          ),

          const Spacer(),

          // Logout Button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: ElevatedButton.icon(
              onPressed: () => _handleLogout(context),
              icon: const Icon(Icons.logout),
              label: const Text("Logout"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                minimumSize: const Size.fromHeight(50),
                textStyle: const TextStyle(fontSize: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
