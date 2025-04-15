import 'package:flutter/material.dart';
import 'package:cut2style/app/themes/app_text_styles.dart';
import 'package:cut2style/core/constants/colors.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final String price;
  final String imageUrl;
  final VoidCallback onAddToCart;
  final VoidCallback onViewDetails;

  const ProductCard({
    required this.title,
    required this.price,
    required this.imageUrl,
    required this.onAddToCart,
    required this.onViewDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.accent.withOpacity(0.1)),
        borderRadius: BorderRadius.circular(12),
        color: AppColors.textLight.withOpacity(0.05),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              imageUrl,
              height: 60,
              width: 60,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyle.headline3),
                Text(
                  price,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              ElevatedButton(
                onPressed: onAddToCart,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Add to Cart'),
              ),
              const SizedBox(height: 4),
              TextButton(
                onPressed: onViewDetails,
                child: const Text('View Details'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
