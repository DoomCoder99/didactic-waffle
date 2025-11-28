import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

/// Typography styles for the Local Lawyer App
/// Based on mobile design system from Figma
class AppTypography {
  AppTypography._();

  // Headings
  static TextStyle h1({Color? color}) => GoogleFonts.lora(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        height: 1.5,
        color: color ?? AppColors.textPrimary,
      );

  static TextStyle h2({Color? color}) => GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        height: 1.4,
        color: color ?? AppColors.textPrimary,
      );

  static TextStyle h3({Color? color}) => GoogleFonts.inter(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        height: 1.33,
        color: color ?? AppColors.textPrimary,
      );

  static TextStyle h4({Color? color}) => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        height: 1.5,
        color: color ?? AppColors.textPrimary,
      );

  // Body Text
  static TextStyle bodyLarge({Color? color}) => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        height: 1.5,
        color: color ?? AppColors.textPrimary,
      );

  static TextStyle body({Color? color}) => GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        height: 1.43,
        color: color ?? AppColors.textPrimary,
      );

  static TextStyle bodySmall({Color? color}) => GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        height: 1.33,
        color: color ?? AppColors.textSecondary,
      );

  // Special
  static TextStyle button({Color? color}) => GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        height: 1.43,
        color: color ?? AppColors.surface,
      );

  static TextStyle badge({Color? color}) => GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        height: 1.33,
        color: color ?? AppColors.surface,
      );

  static TextStyle caption({Color? color}) => GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        height: 1.33,
        color: color ?? AppColors.textSecondary,
      );
}

