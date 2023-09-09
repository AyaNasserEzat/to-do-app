

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todoapp/core/utiles/app_color.dart';

  ThemeData getAppTheme(){
    return  ThemeData(
scaffoldBackgroundColor: AppColor.background,
textTheme:TextTheme(
  displayLarge: GoogleFonts.lato(
              fontSize: 32,
              color: AppColor.withe,
            ),
            displayMedium: GoogleFonts.lato(
                fontSize: 16,
                color: AppColor.withe,
              ),
              displaySmall:  GoogleFonts.lato(
                fontSize: 16,
                color: AppColor.withe.withOpacity(.44),
              ),
),
elevatedButtonTheme: ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
),
    );
  }

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
