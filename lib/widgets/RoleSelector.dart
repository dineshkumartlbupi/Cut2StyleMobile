import 'package:cut2style/app/themes/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:cut2style/core/constants/colors.dart';

class RoleSelector extends StatelessWidget {
  final String selected;
  final List<String> options;
  final void Function(String) onChanged;

  const RoleSelector({
    super.key,
    required this.selected,
    required this.options,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: options.map((role) {
        final isSelected = selected == role;
        return GestureDetector(
          onTap: () => onChanged(role),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
            decoration: BoxDecoration(
              color: isSelected ? AppColors.primary : Colors.grey.shade100,
              border: Border.all(
                color: isSelected ? AppColors.primary : Colors.grey.shade300,
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                if (isSelected)
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.2),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
              ],
            ),
            child: Text(
              _capitalize(role),
              style: isSelected
                  ? AppTextStyle.button
                  : AppTextStyle.body.copyWith(fontWeight: FontWeight.w600),
            ),
          ),
        );
      }).toList(),
    );
  }

  String _capitalize(String text) =>
      text.isEmpty ? text : '${text[0].toUpperCase()}${text.substring(1)}';
}
