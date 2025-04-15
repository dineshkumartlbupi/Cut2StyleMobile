import 'package:flutter/material.dart';

class AppDropdown extends StatelessWidget {
  final String value;
  final String labelText;
  final List<String> options;
  final void Function(String?) onChanged;
  final String? errorText; // 🔹 Add errorText parameter

  const AppDropdown({
    super.key,
    required this.value,
    required this.labelText,
    required this.options,
    required this.onChanged,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    // Ensure value is within options to prevent the crash
    final safeValue = options.contains(value) ? value : options.first;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // 🔹 Align error to left
      children: [
        DropdownButtonFormField<String>(
          value: safeValue,
          onChanged: onChanged,
          items: options
              .map((e) => DropdownMenuItem<String>(
                    value: e,
                    child: Text(_capitalize(e)),
                  ))
              .toList(),
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: labelText,
          ),
        ),
        if (errorText != null && errorText!.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 4, left: 8),
            child: Text(
              errorText!,
              style: TextStyle(color: Colors.red[700], fontSize: 12),
            ),
          ),
      ],
    );
  }

  String _capitalize(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1);
  }
}
