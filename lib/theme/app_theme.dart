import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Brand colors
  static const Color brandPrimary = Color(0xFF33B4E6);
  static const Color brandSecondary = Color(0xFFB3E5FC);
  static const Color backgroundLight = Color(0xFFFFFFFF);
  static const Color surfaceLight = Color(0xFFF6F8FA);
  static const Color textPrimaryLight = Color(0xFF212121);
  static const Color textSecondaryLight = Color(0xFF616161);

  static const Color backgroundDark = Color(0xFF121212);
  static const Color surfaceDark = Color(0xFF1E1E1E);
  static const Color textPrimaryDark = Color(0xFFF5F5F5);
  static const Color textSecondaryDark = Color(0xFFBDBDBD);

  static const double radius = 8.0;
  static const double padding = 16.0;

  static TextTheme _baseTextTheme(Color primary, Color secondary) {
    final english = GoogleFonts.poppinsTextTheme();
    final fallback = GoogleFonts.robotoTextTheme();
    final merged = english
        .copyWith(
          bodyLarge: english.bodyLarge ?? fallback.bodyLarge,
          bodyMedium: english.bodyMedium ?? fallback.bodyMedium,
          titleMedium: english.titleMedium ?? fallback.titleMedium,
          titleLarge: english.titleLarge ?? fallback.titleLarge,
          labelLarge: english.labelLarge ?? fallback.labelLarge,
        )
        .apply(displayColor: primary, bodyColor: primary);

    // Force Persian glyphs to use Samim via fontFamily override.
    // This sets the default font family; Poppins is used via textTheme metrics, Samim covers Persian glyphs.
    return merged;
  }

  static ThemeData light() {
    final colorScheme = const ColorScheme.light(
      primary: brandPrimary,
      secondary: brandSecondary,
      background: backgroundLight,
      surface: surfaceLight,
      onPrimary: Colors.white,
      onSecondary: textPrimaryLight,
      onBackground: textPrimaryLight,
      onSurface: textPrimaryLight,
    );

    final baseText = _baseTextTheme(textPrimaryLight, textSecondaryLight);

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: backgroundLight,
      fontFamily: 'Samim',
      textTheme: baseText.copyWith(
        bodyLarge: baseText.bodyLarge?.copyWith(color: textPrimaryLight),
        bodyMedium: baseText.bodyMedium?.copyWith(color: textSecondaryLight),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: backgroundLight,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: textPrimaryLight),
        titleTextStyle: TextStyle(
          color: textPrimaryLight,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: backgroundLight,
        selectedItemColor: brandPrimary,
        unselectedItemColor: textSecondaryLight,
        type: BottomNavigationBarType.fixed,
      ),
      tabBarTheme: const TabBarThemeData(
        indicatorSize: TabBarIndicatorSize.label,
        labelStyle: TextStyle(fontWeight: FontWeight.w600),
        labelColor: brandPrimary,
        unselectedLabelColor: textSecondaryLight,
        indicatorColor: brandPrimary,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: brandPrimary,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: padding,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
          elevation: 0,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: brandPrimary,
          side: const BorderSide(color: brandPrimary),
          padding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: padding,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surfaceLight,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: const BorderSide(color: brandPrimary, width: 1.5),
        ),
        contentPadding: const EdgeInsets.all(padding),
      ),
      cardTheme: CardThemeData(
        color: surfaceLight,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        shadowColor: Colors.black.withOpacity(0.06),
        elevation: 0,
        margin: const EdgeInsets.all(padding),
      ),
      dividerColor: Colors.black.withOpacity(0.06),
    );
  }

  static ThemeData dark() {
    final colorScheme = const ColorScheme.dark(
      primary: brandPrimary,
      secondary: brandSecondary,
      background: backgroundDark,
      surface: surfaceDark,
      onPrimary: Colors.white,
      onSecondary: textPrimaryDark,
      onBackground: textPrimaryDark,
      onSurface: textPrimaryDark,
    );

    final baseText = _baseTextTheme(textPrimaryDark, textSecondaryDark);

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: backgroundDark,
      fontFamily: 'Samim',
      textTheme: baseText.copyWith(
        bodyLarge: baseText.bodyLarge?.copyWith(color: textPrimaryDark),
        bodyMedium: baseText.bodyMedium?.copyWith(color: textSecondaryDark),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: surfaceDark,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: textPrimaryDark),
        titleTextStyle: TextStyle(
          color: textPrimaryDark,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: surfaceDark,
        selectedItemColor: brandPrimary,
        unselectedItemColor: textSecondaryDark,
        type: BottomNavigationBarType.fixed,
      ),
      tabBarTheme: const TabBarThemeData(
        indicatorSize: TabBarIndicatorSize.label,
        labelStyle: TextStyle(fontWeight: FontWeight.w600),
        labelColor: brandPrimary,
        unselectedLabelColor: textSecondaryDark,
        indicatorColor: brandPrimary,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: brandPrimary,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: padding,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
          elevation: 0,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: brandPrimary,
          side: const BorderSide(color: brandPrimary),
          padding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: padding,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surfaceDark,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: const BorderSide(color: brandPrimary, width: 1.5),
        ),
        contentPadding: const EdgeInsets.all(padding),
      ),
      cardTheme: CardThemeData(
        color: surfaceDark,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        shadowColor: Colors.black.withOpacity(0.0),
        elevation: 0,
        margin: const EdgeInsets.all(padding),
      ),
      dividerColor: Colors.white.withOpacity(0.06),
    );
  }
}
