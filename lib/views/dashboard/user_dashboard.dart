import 'package:cut2style/services/AuthServicelocal.dart';
import 'package:cut2style/views/user_screens/user_home.dart';
import 'package:cut2style/views/user_screens/user_bookings.dart';
import 'package:cut2style/views/user_screens/user_profile.dart';
import 'package:cut2style/views/user_screens/user_favorites.dart';
import 'package:cut2style/views/user_screens/user_services.dart';
import 'package:cut2style/widgets/bottom_nav.dart';
import 'package:flutter/material.dart';

class UserDashboard extends StatefulWidget {
  const UserDashboard({super.key});

  @override
  State<UserDashboard> createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  int _currentIndex = 0;
  final userModel = AuthService.to.currentUser.value;
  final List<Widget> _screens = [
    UserHomeScreen(),
    UserServices(),
    UserBookings(),
    UserFavorites(),
    UserProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: CustomBottomNav(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
      ),
    );
  }
}
