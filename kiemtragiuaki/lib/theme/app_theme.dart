import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Màu và typography theo template tối giản (xám / đen).
abstract final class AppColors {
  static const Color bg = Color(0xFFFFFFFF);
  static const Color bgMuted = Color(0xFFF3F4F6);
  static const Color text = Color(0xFF111111);
  static const Color textMuted = Color(0xFF6B7280);
  static const Color border = Color(0xFFE5E7EB);
  static const Color btnDark = Color(0xFF1F2937);
}

class AppTheme {
  static ThemeData light() {
    final base = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.btnDark,
        brightness: Brightness.light,
        surface: AppColors.bg,
      ),
      scaffoldBackgroundColor: AppColors.bg,
    );
    return base.copyWith(
      textTheme: GoogleFonts.interTextTheme(base.textTheme).apply(
        bodyColor: AppColors.text,
        displayColor: AppColors.text,
      ),
      dividerColor: AppColors.border,
    );
  }
}
