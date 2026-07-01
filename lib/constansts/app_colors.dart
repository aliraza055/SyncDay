import 'package:flutter/material.dart';

/// Centralized color palette for the whole app.
/// Update a color here and it reflects everywhere.
class AppColors {
  AppColors._();

  // Base
  static const Color background = Color(0xFFFFFFFF);
  static const Color scaffoldGrey = Color(0xFFFAFAFA);

  // Text
  static const Color textPrimary = Color(0xFF0F0F0F);
  static const Color textSecondary = Color(0xFF8A8A8E);
  static const Color textMuted = Color(0xFFB0B0B5);

  // Black / near-black elements (buttons, hero cards)
  static const Color black = Color(0xFF0F0F0F);
  static const Color blackCardGradientStart = Color(0xFF1A1A1A);
  static const Color blackCardGradientEnd = Color(0xFF0A0A0A);

  // Borders / dividers
  static const Color border = Color(0xFFECECEC);
  static const Color divider = Color(0xFFF0F0F0);

  // Cards
  static const Color cardWhite = Color(0xFFFFFFFF);

  // Feature icon colors
  static const Color taskIconStart = Color(0xFF6C63FF);
  static const Color taskIconEnd = Color(0xFF4B47D6);

  static const Color expenseIconStart = Color(0xFFA855F7);
  static const Color expenseIconEnd = Color(0xFF7C3AED);

  static const Color weatherIconStart = Color(0xFF38BDF8);
  static const Color weatherIconEnd = Color(0xFF0EA5E9);

  // Status colors
  static const Color success = Color(0xFF22C55E);
  static const Color danger = Color(0xFFEF4444);
  static const Color checkedGrey = Color(0xFF9CA3AF);

  // Shadow
  static const Color shadow = Color(0x0D000000);
}
