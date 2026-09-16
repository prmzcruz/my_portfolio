import 'package:flutter/material.dart';
import '../constants/colors.dart';

ThemeData kCustomTheme = ThemeData.dark(useMaterial3: true).copyWith(
  scaffoldBackgroundColor: CustomColor.scaffoldBg,
  colorScheme: const ColorScheme.dark(
    primary: CustomColor.accentPurple,
    secondary: CustomColor.accentCyan,
    surface: CustomColor.bgLight1,
  ),
  iconTheme: const IconThemeData(
    color: CustomColor.whitePrimary,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: CustomColor.accentPurple,
      foregroundColor: Colors.white,
      elevation: 4,
      shadowColor: CustomColor.accentPurple.withOpacity(0.4),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      textStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 15,
        letterSpacing: 0.5,
      ),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: CustomColor.whitePrimary,
      side: const BorderSide(color: CustomColor.accentCyan, width: 1.5),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      textStyle: const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 15,
      ),
    ),
  ),
);
