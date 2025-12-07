import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hci_app/src/features/accessibility/accessibility_provider.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final BorderRadius? borderRadius;
  final Color? fillColor;
  final double? fontSize;
  final Color? hintColor;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.controller,
    this.onChanged,
    this.onSubmitted,
    this.prefixIcon,
    this.suffixIcon,
    this.borderRadius,
    this.fillColor,
    this.fontSize,
    this.hintColor,
    this.keyboardType,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final accessibilityProvider = Provider.of<AccessibilityProvider>(context);
    final isLargeFont = accessibilityProvider.largeFont;
    final verticalPadding = isLargeFont ? 24.0 : 18.5;

    return Semantics(
      textField: true,
      label: hintText,
      child: Container(
        decoration: BoxDecoration(
          color: fillColor ?? theme.inputDecorationTheme.fillColor,
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
              child: TextFormField(
                controller: controller,
                onChanged: onChanged,
                onFieldSubmitted: (value) {
                  FocusScope.of(context).unfocus();
                  onSubmitted?.call(value);
                },
                style: theme.textTheme.bodyMedium,
                keyboardType: keyboardType,
                validator: validator,
                decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: theme.textTheme.bodyMedium?.copyWith(color: hintColor ?? theme.hintColor),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: verticalPadding),
                  suffixIcon: suffixIcon,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
