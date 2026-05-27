import 'package:flutter/material.dart';

class AppTextStyle {
  // ========== DISPLAY STYLES ==========
  // Untuk headline besar, promotional content

  static const TextStyle displayLarge = TextStyle(
    fontSize: 57,
    fontWeight: FontWeight.bold,
    height: 1.12,
    letterSpacing: -0.25,
  );

  static const TextStyle displayMedium = TextStyle(
    fontSize: 45,
    fontWeight: FontWeight.bold,
    height: 1.16,
    letterSpacing: 0,
  );

  static const TextStyle displaySmall = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.bold,
    height: 1.22,
    letterSpacing: 0,
  );
  // ========== HEADLINE STYLES ==========
  // Untuk judul section, cards, dialog

  static const TextStyle headlineLarge = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    height: 1.25,
    letterSpacing: 0,
  );

  static const TextStyle headlineMedium = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    height: 1.29,
    letterSpacing: 0,
  );

  static const TextStyle headlineSmall = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    height: 1.33,
    letterSpacing: 0,
  );

  // ========== TITLE STYLES ==========
  // Untuk card titles, list item titles

  static const TextStyle titleLarge = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    height: 1.27,
    letterSpacing: 0,
  );

  static const TextStyle titleMedium = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 1.5,
    letterSpacing: 0.15,
  );

  static const TextStyle titleSmall = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 1.43,
    letterSpacing: 0.1,
  );
  // ========== BODY STYLES ==========
  // Untuk main content, paragraf

  static const TextStyle bodyLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.5,
    letterSpacing: 0.5,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.43,
    letterSpacing: 0.25,
  );

  static const TextStyle bodySmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.33,
    letterSpacing: 0.4,
  );

  // ========== LABEL STYLES ==========
  // Untuk button, badge, tag, hint

  static const TextStyle labelLarge = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 1.43,
    letterSpacing: 0.1,
  );

  static const TextStyle labelMedium = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    height: 1.33,
    letterSpacing: 0.5,
  );

  static const TextStyle labelSmall = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w600,
    height: 1.45,
    letterSpacing: 0.5,
  );

  // ========== HELPER STYLES ==========
  // Untuk caption, error message, helper text

  static const TextStyle caption = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 1.33,
    letterSpacing: 0.4,
  );

  static const TextStyle overline = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w600,
    height: 1.45,
    letterSpacing: 1.5,
  );

  // ========== CONVENIENCE METHODS ==========
  // Untuk menambah warna dengan mudah

  static TextStyle displayLargeColor(Color color) =>
      displayLarge.copyWith(color: color);

  static TextStyle headlineLargeColor(Color color) =>
      headlineLarge.copyWith(color: color);

  static TextStyle bodyLargeColor(Color color) =>
      bodyLarge.copyWith(color: color);

  // ========== THEME INTEGRATION ==========
  // Untuk mengintegrasikan dengan ThemeData

  static TextTheme getTextTheme(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDark ? Colors.white : Colors.black87;
    final secondaryTextColor = isDark ? Colors.white70 : Colors.black54;

    return TextTheme(
      displayLarge: displayLarge.copyWith(color: textColor),
      displayMedium: displayMedium.copyWith(color: textColor),
      displaySmall: displaySmall.copyWith(color: textColor),
      headlineLarge: headlineLarge.copyWith(color: textColor),
      headlineMedium: headlineMedium.copyWith(color: textColor),
      headlineSmall: headlineSmall.copyWith(color: textColor),
      titleLarge: titleLarge.copyWith(color: textColor),
      titleMedium: titleMedium.copyWith(color: textColor),
      titleSmall: titleSmall.copyWith(color: textColor),
      bodyLarge: bodyLarge.copyWith(color: textColor),
      bodyMedium: bodyMedium.copyWith(color: secondaryTextColor),
      bodySmall: bodySmall.copyWith(color: secondaryTextColor),
      labelLarge: labelLarge.copyWith(color: textColor),
      labelMedium: labelMedium.copyWith(color: textColor),
      labelSmall: labelSmall.copyWith(color: textColor),
    );
  }
}
