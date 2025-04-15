import 'package:cut2style/app/themes/app_text_styles.dart';
import 'package:cut2style/core/constants/colors.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String title;
  final Widget icon;

  const CategoryCard({
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
            color: AppColors.textLight.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.accent.withOpacity(0.1)),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: icon,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          title,
          style: AppTextStyle.subtitle,
        ),
      ],
    );
  }
}
