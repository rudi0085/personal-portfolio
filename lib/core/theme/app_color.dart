import 'package:flutter/material.dart';

class AppColors {
  // ========== PRIMARY COLORS ==========
  // Warna utama brand

  static const Color primary = Color(0xFF6200EA);
  static const Color primaryLight = Color(0xFF9C27B0);
  static const Color primaryDark = Color(0xFF3700B3);
  static const Color primaryContainer = Color(0xFFEADDFF);

  // ========== SECONDARY COLORS ==========
  // Warna sekunder pendamping

  static const Color secondary = Color(0xFF03DAC6);
  static const Color secondaryLight = Color(0xFF66FFF9);
  static const Color secondaryDark = Color(0xFF00B8A9);
  static const Color secondaryContainer = Color(0xFFB1FFFD);

  // ========== TERTIARY COLORS ==========
  // Warna tersier untuk aksen tambahan

  static const Color tertiary = Color(0xFFFF6D7F);
  static const Color tertiaryLight = Color(0xFFFFB3BA);
  static const Color tertiaryDark = Color(0xFFFF4757);
  static const Color tertiaryContainer = Color(0xFFFFE5E8);

  // ========== SEMANTIC COLORS ==========
  // Warna untuk status dan aksi

  static const Color success = Color(0xFF4CAF50);
  static const Color successLight = Color(0xFF8BC34A);
  static const Color successDark = Color(0xFF2E7D32);
  static const Color successContainer = Color(0xFFC8E6C9);

  static const Color error = Color(0xFFB3261E);
  static const Color errorLight = Color(0xFFEF5350);
  static const Color errorDark = Color(0xFF8B0000);
  static const Color errorContainer = Color(0xFFF9DEDC);

  static const Color warning = Color(0xFFFFC107);
  static const Color warningLight = Color(0xFFFFD54F);
  static const Color warningDark = Color(0xFFFFA000);
  static const Color warningContainer = Color(0xFFFFF9C4);

  static const Color info = Color(0xFF2196F3);
  static const Color infoLight = Color(0xFF64B5F6);
  static const Color infoDark = Color(0xFF1565C0);
  static const Color infoContainer = Color(0xFFE3F2FD);

  // ========== NEUTRAL COLORS ==========
  // Gray scale untuk background, text, border

  static const Color neutral100 = Color(0xFFFFFFFF);
  static const Color neutral99 = Color(0xFFFBFBFB);
  static const Color neutral95 = Color(0xFFF0F0F0);
  static const Color neutral90 = Color(0xFFE6E6E6);
  static const Color neutral80 = Color(0xFFCCCCCC);
  static const Color neutral70 = Color(0xFFB3B3B3);
  static const Color neutral60 = Color(0xFF999999);
  static const Color neutral50 = Color(0xFF808080);
  static const Color neutral40 = Color(0xFF666666);
  static const Color neutral30 = Color(0xFF4D4D4D);
  static const Color neutral20 = Color(0xFF333333);
  static const Color neutral10 = Color(0xFF1A1A1A);
  static const Color neutral0 = Color(0xFF000000);

  // ========== SURFACE COLORS ==========
  // Untuk background dan elevated surface

  static const Color surface = Color(0xFFFFFBFE);
  static const Color surfaceVariant = Color(0xFFE7E0EC);
  static const Color surfaceDim = Color(0xFFDDD9E5);
  static const Color surfaceBright = Color(0xFFFFF8FD);
  static const Color surfaceContainer = Color(0xFFF3EEF7);
  static const Color surfaceContainerHigh = Color(0xFFEDE9F3);
  static const Color surfaceContainerHighest = Color(0xFFE8E3ED);

  // ========== DARK MODE COLORS ==========
  // Untuk dark theme

  static const Color darkPrimary = Color(0xFFD0BCFF);
  static const Color darkSecondary = Color(0xFF80F7F1);
  static const Color darkTertiary = Color(0xFFFFB4AB);
  static const Color darkError = Color(0xFFF2B8B5);
  static const Color darkSurface = Color(0xFF1C1B1F);
  static const Color darkSurfaceVariant = Color(0xFF49454E);
  static const Color darkOutline = Color(0xFF79747E);
  static const Color darkOutlineVariant = Color(0xFF49454E);
  static const Color darkScrim = Color(0xFF000000);

  // ========== BORDER & DIVIDER COLORS ==========
  static const Color border = Color(0xFFE0E0E0);
  static const Color borderDark = Color(0xFF424242);
  static const Color divider = Color(0xFFBDBDBD);

  // ========== OVERLAY COLORS ==========
  static const Color overlay20 = Color(0x33000000); // 20% black
  static const Color overlay40 = Color(0x66000000); // 40% black
  static const Color overlay60 = Color(0x99000000); // 60% black

  // ========== SHADOW COLOR ==========
  static const Color shadow = Color(0xFF000000);

  // ========== CONVENIENCE METHODS ==========

  /// Dapatkan warna primary dengan opacity
  static Color primaryWithOpacity(double opacity) =>
      primary.withValues(alpha: opacity);

  /// Dapatkan warna error dengan opacity
  static Color errorWithOpacity(double opacity) =>
      error.withValues(alpha: opacity);

  /// Dapatkan warna success dengan opacity
  static Color successWithOpacity(double opacity) =>
      success.withValues(alpha: opacity);

  // ========== LIGHT THEME PALETTE ==========
  static const ColorScheme lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: primary,
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: primaryContainer,
    onPrimaryContainer: Color(0xFF21005D),
    secondary: secondary,
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: secondaryContainer,
    onSecondaryContainer: Color(0xFF002621),
    tertiary: tertiary,
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: tertiaryContainer,
    onTertiaryContainer: Color(0xFF410E0B),
    error: error,
    onError: Color(0xFFFFFFFF),
    errorContainer: errorContainer,
    onErrorContainer: Color(0xFF410E0B),
    surface: surface,
    onSurface: neutral20,
    surfaceContainer: surfaceVariant,
    onSurfaceVariant: Color(0xFF49454E),
    outline: Color(0xFF79747E),
    outlineVariant: Color(0xFFCAC7D0),
    shadow: shadow,
    scrim: Color(0xFF000000),
    inverseSurface: Color(0xFF313033),
    onInverseSurface: Color(0xFFF5EFF7),
    inversePrimary: Color(0xFFD0BCFF),
  );

  // ========== DARK THEME PALETTE ==========
  static const ColorScheme darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: darkPrimary,
    onPrimary: Color(0xFF370B1E),
    primaryContainer: Color(0xFF4F2C5F),
    onPrimaryContainer: Color(0xFFEADDFF),
    secondary: darkSecondary,
    onSecondary: Color(0xFF003732),
    secondaryContainer: Color(0xFF00504E),
    onSecondaryContainer: Color(0xFFB1FFFD),
    tertiary: darkTertiary,
    onTertiary: Color(0xFF601410),
    tertiaryContainer: Color(0xFF8B302D),
    onTertiaryContainer: Color(0xFFFFDAD6),
    error: darkError,
    onError: Color(0xFF601410),
    errorContainer: Color(0xFF8B302D),
    onErrorContainer: Color(0xFFF9DEDC),
    surface: darkSurface,
    onSurface: neutral90,
    surfaceContainer: darkSurfaceVariant,
    onSurfaceVariant: darkOutlineVariant,
    outline: darkOutline,
    outlineVariant: Color(0xFF49454E),
    shadow: shadow,
    scrim: Color(0xFF000000),
    inverseSurface: neutral95,
    onInverseSurface: neutral10,
    inversePrimary: primary,
  );
}
