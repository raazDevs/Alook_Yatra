import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    brightness: Brightness.light,
    primaryColor: const Color(0xFF2BACED),
    hintColor: Colors.blueAccent,
    textTheme: TextTheme(
      bodyMedium: GoogleFonts.aBeeZee(color: Colors.black),
    ));

final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    brightness: Brightness.dark,
    primaryColor: const Color(0xFF2BACED),
    textTheme: TextTheme(
      bodyMedium: GoogleFonts.aBeeZee(color: Colors.black),
    ));
