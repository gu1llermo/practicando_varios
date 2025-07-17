import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DeliveryColors {
  static const purple =  Color(0xFF5117AC);
  static const green =  Color(0xFF20D0C4);
  static const dark =  Color(0xFF03091E);
  static const grey =  Color(0xFF212738);
  static const lightGrey =  Color(0xFFBBBBBB);
  static const veryLightGrey =  Color(0xFFF3F3F3);
  static const white =  Color(0xFFFFFFFF);
  static const pink =  Color(0xFFF5638B);
}

final lightTheme = ThemeData(
  
  textTheme: GoogleFonts.poppinsTextTheme().apply(
    bodyColor: DeliveryColors.purple,
    displayColor: DeliveryColors.purple,
  ),
);