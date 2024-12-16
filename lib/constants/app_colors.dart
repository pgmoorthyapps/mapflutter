import 'dart:ui';

import 'package:flutter/material.dart';

class AppColors {
  // Primary Palette
  static const Color primary = Color(0xFF481b0f); // Blue
  static const Color primaryLight = Color(0xFFBBDEFB); // Light Blue
  static const Color primaryDark = Color(0xFF1565C0); // Dark Blue

  // Secondary Palette
  static const Color secondary = Color(0xFFFFA726); // Orange
  static const Color secondaryLight = Color(0xFFFFCC80); // Light Orange
  static const Color secondaryDark = Color(0xFFEF6C00); // Dark Orange

  // Supporting Colors
  static const Color success = Color(0xFF66BB6A); // Green
  static const Color danger = Color(0xFFE53935); // Red
  static const Color warning = Color(0xFFFFC107); // Yellow
  static const Color info = Color(0xFF26C6DA); // Teal

  // Neutral Palette
  static const Color background = Color(0xFFF5F5F5); // Light Grey
  static const Color light = Colors.white;
  static const Color dark = Colors.black;
  static const Color grey = Color(0xFF9E9E9E); // Grey
  static const Color lightGrey = Color(0xFFBDBDBD); // Light Grey
  static const Color lightGrey2 = Color(0xFFE0E0E0); // Very Light Grey

  // Brand Accent (Optional)
  static const Color accent = Color(0xFF9C27B0); // Purple

  // Color Scheme
  static ColorScheme myColorScheme = ColorScheme(
    primary: primary,
    secondary: secondary,
    surface: light,
    background: background,
    error: danger,
    onPrimary: light,
    onSecondary: light,
    onSurface: dark,
    onBackground: dark,
    onError: light,
    brightness: Brightness.light,
  );
}
