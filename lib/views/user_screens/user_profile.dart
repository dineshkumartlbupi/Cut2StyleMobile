import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cut2style/app/routes/app_routes.dart';
import 'package:cut2style/services/AuthServicelocal.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = AuthService.to.currentUser.value;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              AuthService.to.logout(); // Clear user session
              Get.offAllNamed(AppRoutes.login); // Navigate to login screen
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(
                  'assets/images/user_avatar.png'), // Add your asset or NetworkImage
            ),
            const SizedBox(height: 20),
            Text(
              user?.name ?? 'Guest User',
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              user?.email ?? 'Email not found',
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 30),
            ListTile(
              leading: const Icon(Icons.phone),
              title: Text(user?.name ?? 'Not Available'),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.account_circle),
              title: Text(user?.role ?? 'Unknown'),
            ),
            const Spacer(),
            ElevatedButton.icon(
              icon: const Icon(Icons.logout),
              label: const Text("Logout"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
              onPressed: () {
                AuthService.to.logout();
                Get.offAllNamed(AppRoutes.login);
              },
            ),
          ],
        ),
      ),
    );
  }
}
