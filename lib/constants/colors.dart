import 'package:flutter/material.dart';

class CustomColor {
  static const Color scaffoldBg = Color(0xFF0B0F19); // Rich Midnight Navy
  static const Color bgLight1 = Color(0xFF111827);    // Slate Dark Card
  static const Color bgLight2 = Color(0xFF1F2937);    // Elevated Slate
  static const Color cardBg = Color(0xFF1E2640);      // Interactive Card
  
  static const Color textFieldBg = Color(0xFF111827);
  static const Color textFieldBorder = Color(0xFF374151);
  static const Color hintDark = Color(0xFF6B7280);
  
  // Vibrant Modern Accents
  static const Color accentCyan = Color(0xFF38BDF8);   // Vibrant Sky Cyan
  static const Color accentPurple = Color(0xFF8B5CF6); // Electric Purple
  static const Color accentPink = Color(0xFFEC4899);   // Pink Neon
  static const Color yellowSecondary = Color(0xFFFBBF24); // Warm Gold Accent
  static const Color yellowPrimary = Color(0xFFF59E0B);
  
  static const Color whitePrimary = Color(0xFFF8FAFC);
  static const Color whiteSecondary = Color(0xFF94A3B8);

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF6366F1), Color(0xFF8B5CF6), Color(0xFFEC4899)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient buttonGradient = LinearGradient(
    colors: [Color(0xFF3B82F6), Color(0xFF8B5CF6)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const LinearGradient cardBorderGradient = LinearGradient(
    colors: [Color(0x6638BDF8), Color(0x338B5CF6), Color(0x00000000)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
