import 'package:cut2style/core/constants/colors.dart';
import 'package:cut2style/core/constants/strings.dart';
import 'package:cut2style/widgets/custom_button.dart';
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
        title: const Text("My Account"),
        centerTitle: true,
        backgroundColor: AppColors.primary,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              AuthService.to.logout();
              Get.offAllNamed(AppRoutes.login);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Avatar + Name + Email
            Stack(
              children: [
                // Gradient background for the avatar
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [AppColors.accent],
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                Positioned(
                  left: 10,
                  top: 10,
                  child: const CircleAvatar(
                    radius: 45,
                    backgroundImage:
                        AssetImage('assets/images/user_avatar.png'),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: const Icon(Icons.edit,
                          size: 18, color: AppColors.primary),
                      onPressed: () {
                        Get.toNamed(AppRoutes.editProfile);
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              user?.name ?? 'Guest User',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            Text(
              user?.email ?? 'Email not found',
              style: const TextStyle(color: Colors.grey, fontSize: 16),
            ),
            const SizedBox(height: 30),

            // Quick Actions with Cards
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildInfoCard(Icons.shopping_bag, "Orders", () {
                  Get.toNamed(AppRoutes.orderHistory);
                }),
                _buildInfoCard(Icons.favorite, "Wishlist", () {
                  Get.toNamed(AppRoutes.wishlist);
                }),
                _buildInfoCard(Icons.location_on, "Address", () {
                  Get.toNamed(AppRoutes.savedAddresses);
                }),
              ],
            ),
            const SizedBox(height: 30),

            // More Options List
            _buildProfileTile(
              icon: Icons.edit,
              title: "Edit Profile",
              subtitle: "Update your info",
              onTap: () => Get.toNamed(AppRoutes.editProfile),
            ),
            _buildProfileTile(
              icon: Icons.brightness_6,
              title: "Appearance",
              subtitle: "Light / Dark Mode",
              onTap: () => Get.toNamed(AppRoutes.themeSettings),
            ),
            _buildProfileTile(
              icon: Icons.support_agent,
              title: "Support & Help",
              subtitle: "Get help or report an issue",
              onTap: () => Get.toNamed(AppRoutes.supportCenter),
            ),
            _buildProfileTile(
              icon: Icons.qr_code,
              title: "Referral Code",
              subtitle: "Share with friends",
              onTap: () => Get.toNamed(AppRoutes.referralCode),
            ),
            _buildProfileTile(
              icon: Icons.payment,
              title: "Payment Methods",
              subtitle: "Manage your cards",
              onTap: () => Get.toNamed(AppRoutes.paymentMethods),
            ),

            const SizedBox(height: 20),
            CustomButton(
              icon: const Icon(Icons.logout),
              text: AppStrings.logout,
              onPressed: () {
                AuthService.to.logout();
                Get.offAllNamed(AppRoutes.login);
              },
            ),
            // Logout Button with a red accent
          ],
        ),
      ),
    );
  }

  // Info Card Builder for Quick Actions
  Widget _buildInfoCard(IconData icon, String title, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            border: Border.all(color: AppColors.primary.withOpacity(0.1))),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 26),
          child: Column(
            children: [
              CircleAvatar(
                backgroundColor: AppColors.textLight.withOpacity(0.2),
                child: Icon(icon, color: AppColors.primary),
                radius: 25,
              ),
              const SizedBox(height: 6),
              Text(
                title,
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Profile Tile Builder for the list items
  Widget _buildProfileTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          border: Border.all(color: AppColors.primary.withOpacity(0.1))),
      child: ListTile(
        leading: Icon(icon, color: AppColors.primary),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text(subtitle, style: const TextStyle(color: Colors.grey)),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}
