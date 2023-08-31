
import 'dart:html';

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
