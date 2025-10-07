// ====================
// ProfessionalDashboard.dart
// ====================
import 'package:cut2style/services/AuthServicelocal.dart';
import 'package:cut2style/views/pro_screens/pro_earnings.dart';
import 'package:cut2style/views/pro_screens/pro_home.dart';
import 'package:cut2style/views/pro_screens/pro_jobs.dart';
import 'package:cut2style/views/pro_screens/pro_profile.dart';
import 'package:cut2style/widgets/CustomAppBar.dart';
import 'package:cut2style/widgets/bottom_nav.dart';
import 'package:flutter/material.dart';

class ProfessionalDashboard extends StatefulWidget {
  const ProfessionalDashboard({super.key});

  @override
  State<ProfessionalDashboard> createState() => _ProfessionalDashboardState();
}

class _ProfessionalDashboardState extends State<ProfessionalDashboard> {
  int _currentIndex = 0;
  final userModel = AuthService.to.currentUser.value;
  final List<Widget> _screens = [
    const ProHomeScreen(),
    const ProJobsScreen(),
    const ProEarningsScreen(),
    const ProProfileScreen(),
  ];

  final List<String> _titles = ["Dashboard", "Jobs", "Earnings", "Profile"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: CustomAppbar(
            onProfilePressed: () {},
            onNotificationPressed: () {},
            onMenuPressed: () {},
            hasNotifications: true,
            badgeCount: 0, // Example badge count
            usersData: userModel,
            title: '', // Profile pictureaddf URL
          )),
      body: _screens[_currentIndex],
      bottomNavigationBar: CustomBottomNav(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
      ),
    );
  }
}
