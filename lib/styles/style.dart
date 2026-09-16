import 'package:flutter/material.dart';
import '../constants/colors.dart';

BoxDecoration kHeaderDecoration = BoxDecoration(
  color: CustomColor.scaffoldBg.withOpacity(0.85),
  borderRadius: BorderRadius.circular(50),
  border: Border.all(
    color: CustomColor.whiteSecondary.withOpacity(0.15),
    width: 1,
  ),
  boxShadow: [
    BoxShadow(
      color: Colors.black.withOpacity(0.3),
      blurRadius: 20,
      offset: const Offset(0, 10),
    ),
  ],
);

// Alias for backwards compatibility
BoxDecoration kHederDecoration = kHeaderDecoration;

BoxDecoration kCardDecoration = BoxDecoration(
  color: CustomColor.bgLight1,
  borderRadius: BorderRadius.circular(16),
  border: Border.all(
    color: CustomColor.whiteSecondary.withOpacity(0.1),
    width: 1,
  ),
  boxShadow: [
    BoxShadow(
      color: Colors.black.withOpacity(0.2),
      blurRadius: 15,
      offset: const Offset(0, 8),
    ),
  ],
);
