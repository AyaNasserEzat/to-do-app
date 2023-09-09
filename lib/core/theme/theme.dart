import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utiles/app_color.dart';


ThemeData getAppDarkTheme() {
  return ThemeData(
    primaryColor: AppColor.primary,
    //scaffoldBackgroundColor
    scaffoldBackgroundColor: AppColor.background,
    //appBar theme
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColor.background,
      centerTitle: true,
    ),
    //text theme
    textTheme: TextTheme(
      displayLarge: GoogleFonts.lato(
        color: AppColor.withe,
        fontWeight: FontWeight.bold,
        fontSize: 32,
      ),
      displayMedium: GoogleFonts.lato(
        color: AppColor.withe,
        fontSize: 16,
      ),
      displaySmall: GoogleFonts.lato(
        color: AppColor.withe.withOpacity(0.44),
        fontSize: 16,
      ),
    ),
    //button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.primary,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8)))),
                inputDecorationTheme: InputDecorationTheme(
                   //enabled border
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)),
                    //fouced border
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)),
                    //hint
                    hintStyle: GoogleFonts.lato(
        color: AppColor.withe,
        fontSize: 16,
      ),
                    //fill color
                    fillColor: AppColor.lightBlack,
                    filled: true
                ),
  );
}

ThemeData getAppTheme() {
  return ThemeData(
    primaryColor: AppColor.primary,
    //scaffoldBackgroundColor
    scaffoldBackgroundColor: AppColor.withe,
    //appBar theme
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColor.withe,
      centerTitle: true,
    ),
    //text theme
    textTheme: TextTheme(
      displayLarge: GoogleFonts.lato(
        color: AppColor.background,
        fontWeight: FontWeight.bold,
        fontSize: 32,
      ),
      displayMedium: GoogleFonts.lato(
        color: AppColor.background,
        fontSize: 16,
      ),
      displaySmall: GoogleFonts.lato(
        color: AppColor.background.withOpacity(0.44),
        fontSize: 16,
      ),
    ),
    //button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.primary,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4)))),
  );
}
