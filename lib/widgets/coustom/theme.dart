import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gutenberg/widgets/core/app_color.dart';

ThemeData coustomTheme = ThemeData(
  scaffoldBackgroundColor: AppColor.background,
  fontFamily: GoogleFonts.poppins().fontFamily,
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: TextStyle(color: AppColor.primary),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColor.primary),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColor.primary),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColor.primary),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColor.primary),
    ),
  ),
);
