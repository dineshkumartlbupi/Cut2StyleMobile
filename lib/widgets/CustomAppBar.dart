import 'package:cut2style/app/themes/app_text_styles.dart';
import 'package:cut2style/core/constants/colors.dart';
import 'package:cut2style/models/UserModel.dart';
import 'package:flutter/material.dart';

class CustomAppbar extends StatefulWidget {
  final VoidCallback onProfilePressed;
  final VoidCallback onNotificationPressed;
  final VoidCallback onMenuPressed;
  final bool hasNotifications;
  final int badgeCount; // Badge count for notifications
  final UserModel? usersData;

  const CustomAppbar({
    super.key,
    required this.onProfilePressed,
    required this.onNotificationPressed,
    required this.onMenuPressed,
    required this.hasNotifications,
    required this.badgeCount,
    this.usersData,
    required String title,
  });

  @override
  State<CustomAppbar> createState() => _CustomAppbarState();
}

class _CustomAppbarState extends State<CustomAppbar> {
  bool get hasNotifications => widget.hasNotifications;
  int get badgeCount => widget.badgeCount;

  @override
  Widget build(BuildContext context) {
    double topPadding = MediaQuery.of(context).padding.top + 8;
    final user = widget.usersData;

    return Container(
      decoration: const BoxDecoration(),
      padding: EdgeInsets.only(top: topPadding, left: 16, right: 16, bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left side - Logo and App Name
          Row(
            children: [
              Text(
                "BeePro",
                style: AppTextStyle.headline1,
              ),
              // SvgPicture.asset(
              //   'assets/images/dlogo.svg',
              //   height: 40,
              // ),
              const SizedBox(width: 10),
            ],
          ),

          // Right side - Menu, Notifications, Profile
          Row(
            children: [
              // Menu Icon Button
              IconButton(
                icon: const Icon(
                  Icons.shopping_cart_sharp,
                  color: Color(0xFF4A4A4A),
                  size: 28,
                ),
                onPressed: widget.onMenuPressed,
              ),

              const SizedBox(width: 8),

              SizedBox(
                width: 40,
                height: 40,
                child: Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: widget.onProfilePressed,
                    child: CircleAvatar(
                        radius: 40,
                        backgroundColor: AppColors.primary,
                        child: Text(
                          user?.name.isNotEmpty == true
                              ? user!.name[0].toUpperCase()
                              : 'G',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        )),
                  ),
                ),
              ),
              // Profile Avatar Icon
            ],
          ),
        ],
      ),
    );
  }
}
