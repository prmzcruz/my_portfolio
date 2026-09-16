import 'package:flutter/material.dart';
import '../constants/colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.controller,
    this.maxLines = 1,
    this.hintText,
    this.prefixIcon,
  });

  final TextEditingController? controller;
  final int maxLines;
  final String? hintText;
  final IconData? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      style: const TextStyle(
        color: CustomColor.whitePrimary,
        fontSize: 14,
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(18),
        filled: true,
        fillColor: CustomColor.bgLight1,
        prefixIcon: prefixIcon != null
            ? Icon(
                prefixIcon,
                color: CustomColor.accentCyan,
                size: 20,
              )
            : null,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: CustomColor.accentCyan,
            width: 1.5,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: CustomColor.whiteSecondary.withOpacity(0.15),
            width: 1,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: CustomColor.hintDark,
          fontSize: 14,
        ),
      ),
    );
  }
}
