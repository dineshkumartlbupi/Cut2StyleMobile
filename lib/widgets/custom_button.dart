import 'package:cut2style/core/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Icon? icon;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final buttonStyle = ElevatedButton.styleFrom(
      iconColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      minimumSize: const Size(double.infinity, 50),
    );

    return icon == null
        ? ElevatedButton(
            onPressed: onPressed,
            style: buttonStyle,
            child: Text(text, style: const TextStyle(fontSize: 16)),
          )
        : ElevatedButton.icon(
            onPressed: onPressed,
            style: buttonStyle,
            icon: icon!,
            label: Text(text, style: const TextStyle(fontSize: 16)),
          );
  }
}
