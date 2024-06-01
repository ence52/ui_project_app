import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

const Color themeGreen = Color.fromARGB(255, 89, 204, 121);
const Color themeBackground = Color.fromARGB(255, 25, 33, 38);
const Color themeTextGrey = Color.fromARGB(255, 213, 213, 213);
const Color themeDarkGrey = Color.fromARGB(255, 90, 90, 90);
const Color themeLightGrey = Color.fromARGB(255, 122, 122, 122);
const Color tabBarUnselected = Color.fromARGB(255, 194, 194, 194);
const Color tabBarSelected = Color.fromARGB(255, 254, 254, 254);

ThemeData initializeTheme() => ThemeData.dark(useMaterial3: false).copyWith(
      primaryColor: themeGreen,
      switchTheme: const SwitchThemeData(
        thumbColor: WidgetStatePropertyAll(Colors.white),
      ),
      scaffoldBackgroundColor: themeBackground,
      textTheme: GoogleFonts.interTextTheme(),
      appBarTheme: const AppBarTheme(
          elevation: 3,
          color: themeBackground,
          iconTheme: IconThemeData(color: tabBarSelected)),
      inputDecorationTheme: InputDecorationTheme(
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              width: 2, color: themeGreen), // Aktif durumdaki kenarlık rengi
          borderRadius: BorderRadius.circular(8.0),
        ),
        filled: true,
        iconColor: themeDarkGrey,
        hintStyle: GoogleFonts.lato(color: themeLightGrey, fontSize: 11.sp),
        fillColor: tabBarUnselected,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
      iconButtonTheme: const IconButtonThemeData(
        style: ButtonStyle(),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          textStyle: WidgetStatePropertyAll(TextStyle(fontSize: 16.sp)),
          backgroundColor: const WidgetStatePropertyAll(themeGreen),
        ),
      ),
      tabBarTheme: TabBarTheme(
        labelColor: tabBarSelected,
        unselectedLabelColor: tabBarUnselected,
        indicatorColor: themeGreen,
        unselectedLabelStyle: GoogleFonts.lato(fontSize: 11.sp),
        labelStyle: GoogleFonts.lato(
            fontSize: 11.sp,
            fontWeight: FontWeight.bold,
            color: tabBarSelected),
      ),
    );
