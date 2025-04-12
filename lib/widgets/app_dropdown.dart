import 'package:flutter/material.dart';

class AppDropdown extends StatelessWidget {
  final String value;
  final String labelText;
  final List<String> options;
  final void Function(String?) onChanged;

  const AppDropdown({
    super.key,
    required this.value,
    required this.labelText,
    required this.options,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    // Ensure value is within options to prevent the crash
    final safeValue = options.contains(value) ? value : options.first;

    return DropdownButtonFormField<String>(
      value: safeValue,
      onChanged: onChanged,
      items: options
          .map((e) =>
              DropdownMenuItem<String>(value: e, child: Text(_capitalize(e))))
          .toList(),
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: labelText,
      ),
    );
  }

  // Optional: Capitalize first letter for a nicer UI
  String _capitalize(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1);
  }
}
