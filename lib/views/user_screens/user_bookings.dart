import 'package:cut2style/app/routes/app_routes.dart';
import 'package:cut2style/app/themes/app_text_styles.dart';
import 'package:cut2style/core/constants/colors.dart';
import 'package:cut2style/providers/cart_provider.dart';
import 'package:cut2style/widgets/ActiveBookingCard.dart';
import 'package:cut2style/widgets/ProfessionalCard.dart';
import 'package:cut2style/widgets/ProductCard.dart';
import 'package:cut2style/widgets/custom_appbar.dart';
import 'package:cut2style/widgets/CategoryCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class UserBookings extends StatelessWidget {
  UserBookings({super.key});
  final List<Map<String, dynamic>> productCategories = [
    {
      'title': 'Hair Care',
      'imageUrl':
          "https://www.awaysomearticle.com/wp-content/uploads/2020/02/Best-Hair-Care-Tips.jpg"
    },
    {
      'title': 'Skin Care',
      'imageUrl': "https://images.soco.id/442-shutterstock_1082997017.jpg.jpg",
    },
    {
      'title': 'Tools',
      'imageUrl':
          "https://cdn.notinoimg.com/banner6/revolution_haircare/5057566584272_01-o/revolution-haircare-scalp-derma-roller-massage-tool-for-scalp_.jpg"
    },
    {
      'title': 'Oils',
      'imageUrl':
          "https://img.freepik.com/premium-photo/healthcare-spa-beauty-concept-beautiful-woman-with-oil-bottle_380164-48866.jpg",
    },
  ];

  final List<Map<String, dynamic>> products = [
    {
      'title': 'Hair Serum',
      'price': '\$12.99',
      'imageUrl':
          'https://m.media-amazon.com/images/I/71RXg5+3dRL._SL1500_.jpg',
    },
    {
      'title': 'Face Wash',
      'price': '\$8.50',
      'imageUrl':
          'https://www.pharmacy.ie/wp-content/uploads/2020/09/371875-1.png',
    },
    {
      'title': 'Shaving Kit',
      'price': '\$15.00',
      'imageUrl':
          'https://th.bing.com/th/id/OIP.pDyhtaatc8xZipBHiqfbbgHaHa?rs=1&pid=ImgDetMain',
    },
  ];

  final List<Map<String, dynamic>> serviceCategories = [
    {
      'title': 'Cleaning',
      'imageUrl':
          "https://cleaningwithlove.ca/wp-content/uploads/2017/02/Cleaning-With-Love-Professionals-Cleaning-a-Living-Room.jpg"
    },
    {
      'title': 'Plumbing',
      'imageUrl':
          "https://wallpapers.com/images/hd/close-up-plumber-fixing-plumbing-system-dd8m1skb7w7io73q.jpg",
    },
    {
      'title': 'Electrical',
      'imageUrl':
          "https://img.freepik.com/premium-photo/electricity-electrical-maintenance-service-engineer-hand-holding-ac-voltmeter-checking-electric-current-voltage-circuit-breaker-terminal-cable-wiring-main-power-distribution-board_101448-4286.jpg?w=2000"
    },
    {
      'title': 'Gardening',
      'imageUrl':
          "https://www.thewowstyle.com/wp-content/uploads/2020/10/image1-13.jpg",
    },
  ];

  void addToCart(Map<String, dynamic> product, BuildContext context) {
    Provider.of<CartProvider>(context, listen: false).addToCart(product);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${product['title']} added to cart!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(),
              Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text('Product Categories',
                        style: AppTextStyle.headline2),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: productCategories.map((category) {
                        return CategoryCard(
                          title: category['title'],
                          icon: Image.network(
                            category['imageUrl'],
                            height: 48,
                            width: 48,
                            fit: BoxFit.cover,
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 16),
                    const Text('Active Products',
                        style: AppTextStyle.headline2),
                    const SizedBox(height: 8),
                    Column(
                      children: products.map((product) {
                        return ProductCard(
                          title: product['title'],
                          price: product['price'],
                          imageUrl: product['imageUrl'],
                          onAddToCart: () {
                            final cartProvider = Provider.of<CartProvider>(
                                context,
                                listen: false);

                            // Check if product already exists in the cart
                            final alreadyInCart = cartProvider.cartList.any(
                                (item) => item['title'] == product['title']);

                            if (alreadyInCart) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                      '${product['title']} is already in the cart!'),
                                  backgroundColor: AppColors.primary,
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            } else {
                              cartProvider.addToCart(product);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                      '${product['title']} added to cart!'),
                                  backgroundColor: AppColors.primary,
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            }
                          },

                          // addToCart(product, context),
                          onViewDetails: () {
                            // 🔍 View details logic
                            print('Viewing details of ${product['title']}');
                            // You can navigate to a detailed screen here
                          },
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 16),
                    const Text('Service Categories',
                        style: AppTextStyle.headline2),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: serviceCategories.map((category) {
                        return CategoryCard(
                          title: category['title'],
                          icon: Image.network(
                            category['imageUrl'],
                            height: 48,
                            width: 48,
                            fit: BoxFit.cover,
                          ),
                        );
                      }).toList(),
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
                        border: Border.all(
                            color: AppColors.accent.withOpacity(0.1)),
                        borderRadius: BorderRadius.circular(12),
                        gradient: const LinearGradient(
                            colors: [AppColors.primary, AppColors.accent]),
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
                    Container(
                      margin: EdgeInsets.only(top: 8),
                      decoration: BoxDecoration(
                          color: AppColors.textLight.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                              color: AppColors.accent.withOpacity(0.1))),
                      padding: EdgeInsets.all(16),
                      child: ListTile(
                        title: Text(
                          'Spring Cleaning Deal',
                        ),
                        subtitle: Text(
                          'Get 20% off on your first cleaning service booking',
                        ),
                        trailing: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: const Text('Book Now'),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
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
      {required this.label, required this.icon, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
            onTap: () {
              Get.toNamed(AppRoutes.login); // Navigate to sign-up screen
            },
            child: Container(
              padding: const EdgeInsets.all(16),
              height: 64,
              width: 64,
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColors.primary
                    : AppColors.textLight.withOpacity(0.1),
                shape: BoxShape.circle, // Make it a perfect circle
                border: Border.all(
                  color: AppColors.accent.withOpacity(0.1),
                ),
              ),
              child: icon,
            )),
        SizedBox(height: 4),
        Text(label),
      ],
    );
  }
}
