import 'package:cut2style/app/themes/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:cut2style/core/constants/colors.dart';

class RoleSelector extends StatelessWidget {
  final String selected;
  final List<String> options;
  final void Function(String) onChanged;
  final String? errorText; // 🔹 New parameter

  const RoleSelector({
    super.key,
    required this.selected,
    required this.options,
    required this.onChanged,
    this.errorText, // 🔹 Accept error text
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // 🔹 Align error to left
      children: [
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: options.map((role) {
            final isSelected = selected == role;
            return GestureDetector(
              onTap: () => onChanged(role),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.primary : Colors.grey.shade100,
                  border: Border.all(
                    color: isSelected
                        ? AppColors.primary
                        : AppColors.primary.withOpacity(0.2),
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
        ),
        if (errorText != null && errorText!.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 4, left: 8),
            child: Text(
              errorText!,
              style: TextStyle(
                color: Colors.red[700],
                fontSize: 12,
              ),
            ),
          ),
      ],
    );
  }

  String _capitalize(String text) =>
      text.isEmpty ? text : '${text[0].toUpperCase()}${text.substring(1)}';
}
