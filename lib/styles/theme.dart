import 'package:flutter/material.dart';

import '../constants/colors.dart';

ThemeData kCustomTheme = ThemeData.dark().copyWith(
  scaffoldBackgroundColor: CustomColor.scaffoldBg,
  colorScheme: const ColorScheme.dark(
    primary: CustomColor.yellowSecondary,
    secondary: CustomColor.yellowPrimary,
    surface: CustomColor.surface,
  ),
  iconTheme: const IconThemeData(color: CustomColor.whitePrimary),
  textTheme: ThemeData.dark().textTheme.apply(
        fontFamily: 'Arial',
        bodyColor: CustomColor.whitePrimary,
        displayColor: CustomColor.whitePrimary,
      ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: CustomColor.yellowSecondary,
      foregroundColor: CustomColor.scaffoldBg,
      elevation: 0,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 17),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      textStyle: const TextStyle(fontWeight: FontWeight.w800, fontSize: 15),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: CustomColor.textFieldBg,
    hintStyle: const TextStyle(color: CustomColor.hintDark),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(color: CustomColor.border),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(color: CustomColor.border),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(color: CustomColor.yellowSecondary, width: 1.5),
    ),
  ),
);
