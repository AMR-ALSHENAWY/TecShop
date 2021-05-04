import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tecshop_git/themes/light_color.dart';
import 'light_color.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: LightColors.primaryColor,
    accentColor: LightColors.accentColor,
    textTheme: TextTheme(
      subtitle1: GoogleFonts.ubuntu(color: Colors.black, fontSize: 16),
      subtitle2: GoogleFonts.nunito(color: Colors.black, fontSize: 16),
      headline1: GoogleFonts.quicksand(color: Colors.black, fontSize: 24, fontWeight: FontWeight.w700),
      headline2: GoogleFonts.righteous(color: Colors.black, fontSize: 24, fontWeight: FontWeight.w700),
    ),
  );
}
