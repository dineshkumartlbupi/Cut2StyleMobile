import 'package:cut2style/app/routes/app_routes.dart';
import 'package:cut2style/app/themes/app_text_styles.dart';
import 'package:cut2style/core/constants/colors.dart';
import 'package:cut2style/widgets/ActiveBookingCard.dart';
import 'package:cut2style/widgets/ProfessionalCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class UserHomeScreen extends StatelessWidget {
  const UserHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.location_on),
                      SizedBox(width: 4),
                      Text('123 Main Street, New York, NY'),
                    ],
                  ),
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      const Icon(
                        Icons.notifications,
                        size: 28,
                      ),
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red,
                        ),
                        child: const Text('3',
                            style:
                                TextStyle(color: Colors.white, fontSize: 10)),
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _QuickAction(
                    isSelected: true,
                    icon: SvgPicture.asset(
                      'assets/icons/addperson.svg',
                      height: 24,
                      width: 24,
                    ),
                    label: 'Sign Up',
                  ),
                  _QuickAction(
                    isSelected: false,
                    icon: SvgPicture.asset(
                      'assets/icons/booking.svg',
                      height: 24,
                      width: 24,
                    ),
                    label: 'Bookings',
                  ),
                  _QuickAction(
                    isSelected: false,
                    icon: SvgPicture.asset(
                      'assets/icons/wallet.svg',
                      height: 24,
                      width: 24,
                    ),
                    label: 'Wallet',
                  ),
                  _QuickAction(
                    isSelected: false,
                    icon: SvgPicture.asset(
                      'assets/icons/message.svg',
                      height: 24,
                      width: 24,
                    ),
                    label: 'Messages',
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const TextField(
                decoration: InputDecoration(
                  hintText: 'Find services in your area',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                ),
              ),
              const SizedBox(height: 16),
              const Text('Service Categories', style: AppTextStyle.headline2),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _CategoryTile(
                    title: 'Cleaning',
                    icon: Image.asset("assets/images/cleaning.png", height: 30),
                  ),
                  _CategoryTile(
                    title: 'Plumbing',
                    icon:
                        Image.asset("assets/images/plumibing.png", height: 30),
                  ),
                  _CategoryTile(
                    title: 'Electrical',
                    icon:
                        Image.asset("assets/images/electrical.png", height: 30),
                  ),
                  _CategoryTile(
                    title: 'Gardening',
                    icon:
                        Image.asset("assets/images/gardining.png", height: 30),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text('Active Booking', style: AppTextStyle.headline2),
              const ActiveBookingCard(),
              const SizedBox(height: 16),
              const Text('Featured Professionals',
                  style: AppTextStyle.headline2),
              ProfessionalCard(
                name: 'Robert Wilson',
                rating: '4.9',
                reviews: '124 reviews',
                role: 'Expert Plumber',
                imagePath: 'assets/images/pro1.png',
              ),
              ProfessionalCard(
                name: 'Robert Wilson',
                rating: '4.9',
                reviews: '124 reviews',
                role: 'Expert Plumber',
                imagePath: 'assets/images/pro2.png',
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: const LinearGradient(
                      colors: [Colors.deepPurple, Colors.purple]),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Rewards Balance',
                            style: TextStyle(color: Colors.white)),
                        SizedBox(height: 4),
                        Text('\$45.00',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold)),
                        SizedBox(height: 4),
                        Text('Double value for BeePros services',
                            style: TextStyle(color: Colors.white70)),
                      ],
                    ),
                    Switch(value: true, onChanged: null)
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const Text('Special Offers', style: AppTextStyle.headline2),
              Card(
                child: Container(
                  padding: EdgeInsets.all(16),
                  child: ListTile(
                    title: Text('Spring Cleaning Deal'),
                    subtitle: Text(
                        'Get 20% off on your first cleaning service booking'),
                    trailing: ElevatedButton(
                        onPressed: null, child: Text('Book Now')),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _QuickAction extends StatelessWidget {
  final String label;
  final Widget icon; // Changed from SvgPicture to Widget
  final bool isSelected;

  const _QuickAction(
      {required this.label,
      required this.icon,
      required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Get.toNamed(AppRoutes.login); // Navigate to sign-up screen
          },
          child: CircleAvatar(
            backgroundColor:
                isSelected ? AppColors.primary : Colors.grey.shade200,
            radius: 30,
            child: icon,
          ),
        ),
        const SizedBox(height: 4),
        Text(label),
      ],
    );
  }
}

class _CategoryTile extends StatelessWidget {
  final String title;
  final Widget icon;

  const _CategoryTile({
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: Colors.blue.shade50,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(child: icon),
        ),
        const SizedBox(height: 4),
        Text(title),
      ],
    );
  }
}
