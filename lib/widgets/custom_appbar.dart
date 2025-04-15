import 'package:cut2style/providers/cart_provider.dart';
import 'package:cut2style/views/user_screens/cart/CartScreen.dart';
import 'package:flutter/material.dart';
import 'package:cut2style/core/constants/colors.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatelessWidget {
  // final int cartItemCount;

  const CustomAppBar({
    super.key,
    // this.cartItemCount = 0, // Default to 0
  });

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(
        color: AppColors.white,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Logo
              Align(
                alignment: Alignment.centerLeft,
                child: Image.asset(
                  "assets/images/logos.png",
                  height: 54,
                  width: 120,
                  fit: BoxFit.contain,
                ),
              ),

              // Notification & Cart Row
              Row(
                children: [
                  // Cart Icon
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const CartScreen()),
                          );
                        },
                        icon: const Icon(
                          Icons.shopping_cart_outlined,
                          size: 30,
                          color: AppColors.black,
                        ),
                      ),
                      if (cartProvider.cartCount > 0)
                        Positioned(
                          right: 4,
                          top: 4,
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.red,
                            ),
                            child: Text(
                              '${cartProvider.cartCount}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),

                  const SizedBox(width: 8),

                  // Notification Icon
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      const Icon(
                        Icons.notifications_none,
                        size: 32,
                        color: AppColors.black,
                      ),
                      Positioned(
                        right: -2,
                        top: -4,
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red,
                          ),
                          child: const Text(
                            '3',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 6),

          // Location Row
          Row(
            children: const [
              Icon(Icons.location_on, color: AppColors.primary, size: 20),
              SizedBox(width: 6),
              Text(
                '123 Main Street, New York, NY',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
