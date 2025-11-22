import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final Widget? prefixIcon;
  final BorderRadius? borderRadius;
  final Color? fillColor;
  final double? fontSize;
  final Color? hintColor;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.controller,
    this.onChanged,
    this.onSubmitted,
    this.prefixIcon,
    this.borderRadius,
    this.fillColor,
    this.fontSize,
    this.hintColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: fillColor ?? const Color(0xFF2c2c2c),
        borderRadius: borderRadius ?? BorderRadius.circular(12.0),
      ),
      child: Row(
        children: [
          if (prefixIcon != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: prefixIcon,
            ),
          Expanded(
            child: TextField(
              controller: controller,
              onChanged: onChanged,
              onSubmitted: (value) {
                FocusScope.of(context).unfocus(); // Dismiss keyboard on submit
                onSubmitted?.call(value);
              },
              style: TextStyle(
                color: Colors.white, // Assuming white text input
                fontSize: fontSize ?? 16,
              ),
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(
                  color: hintColor ?? const Color(0xFFbdbdbd),
                  fontSize: fontSize ?? 16,
                ),
                border: InputBorder.none, // Remove default underline
                contentPadding: const EdgeInsets.symmetric(vertical: 18.5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
