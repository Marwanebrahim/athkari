import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF2C5926);
  static const Color background = Color(0xFFF6F7F6);
  static const Color white = Color(0xFFFFFFFF);
  static const Color lightGray = Color(0xFF94A3B8);
  static const Color text1 = Color(0xFF0F172A);
  static const Color text2 = Color(0xFF64748B);
  static const Color text3 = Color(0xFF334155);
  static const Color settingIcon = Color(0xFF334155);
  static const Color switchColor = Color(0xFFE2E8F0);
  static const Color switchButton = Color(0xFFD1D5DB);
  static Gradient splashGrad = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [primary.withValues(alpha: 0.15), background],
  );
}
