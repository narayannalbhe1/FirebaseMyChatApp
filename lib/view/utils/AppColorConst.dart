import 'package:flutter/material.dart';

class AppColorConst {
  // Static theme color (used across the app)
  static const Color themeColor = Color(0xFF2196F3); // Blue

  // Background colors
  static const Color lightBackground = Color(0xFFFFFFFF);
  static const Color darkBackground = Color(0xFF121212);

  // Text colors
  static const Color lightTextColor = Color(0xFF000000);
  static const Color darkTextColor = Color(0xFFFFFFFF);

  // Accent colors
  static const Color successColor = Color(0xFF4CAF50); // Green
  static const Color errorColor = Color(0xFFF44336);   // Red
  static const Color warningColor = Color(0xFFFFC107); // Amber

  // Button colors
  static const Color buttonColor = Color(0xFF1976D2);
  static const Color disabledButtonColor = Color(0xFFBDBDBD);

  // Card colors
  static const Color lightCardColor = Color(0xFFF5F5F5);
  static const Color darkCardColor = Color(0xFF1E1E1E);

  // Get color dynamically based on theme
  static Color backgroundColor(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? darkBackground
          : lightBackground;

  static Color textColor(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? darkTextColor
          : lightTextColor;

  static Color cardColor(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? darkCardColor
          : lightCardColor;
}
